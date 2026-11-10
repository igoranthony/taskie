"""Importa o banco do zntt-control offline (SQLite) para a conta de um usuário.

    python manage.py importar_desktop --usuario zntt \\
        --sqlite /tmp/importacao/zntt.db --pasta /tmp/importacao [--simular]

--pasta é a pasta de dados do app offline (%APPDATA%\\com.zntt.control), onde
ficam os caminhos relativos de logos e anexos (attachments/...).

Tudo roda numa transação: se qualquer coisa falhar, nada é gravado. --simular
faz a importação inteira e desfaz no fim, só para conferir os números.
Recusa rodar de novo se o usuário já tiver algum projeto com o mesmo nome.
"""
import mimetypes
import os
import sqlite3
from datetime import datetime, time, timezone as dt_timezone

from django.contrib.auth.models import User
from django.core.files import File
from django.core.management.base import BaseCommand, CommandError
from django.db import transaction
from django.utils import timezone

from apps.authentication.models import UserSettings
from apps.projects.models import Category, Column, Project, ProjectTemplate, Tag
from apps.tasks.enums import ActivityType
from apps.tasks.models import Attachment, Subtask, Task, TaskActivity, TimeEntry

STATUS = {'active': 'ativo', 'paused': 'pausado', 'completed': 'concluido'}
PRIORIDADE = {'low': 'baixa', 'medium': 'media', 'high': 'alta'}
CAMPO = {'title': 'titulo', 'description': 'descricao', 'priority': 'prioridade',
         'due_date': 'data_limite', 'column_id': 'coluna'}


class Simulacao(Exception):
    pass


def utc(texto):
    """'YYYY-MM-DD HH:MM:SS' (CURRENT_TIMESTAMP do SQLite, UTC) → datetime aware."""
    if not texto:
        return None
    texto = str(texto).replace('T', ' ').rstrip('Z')
    for formato in ('%Y-%m-%d %H:%M:%S', '%Y-%m-%d %H:%M:%S.%f', '%Y-%m-%d %H:%M'):
        try:
            return datetime.strptime(texto, formato).replace(tzinfo=dt_timezone.utc)
        except ValueError:
            continue
    raise CommandError(f'Data inválida no banco offline: {texto!r}')


def prazo(texto):
    """'YYYY-MM-DD' → meio-dia no fuso do servidor (o dia não escorrega)."""
    if not texto:
        return None
    dia = datetime.strptime(str(texto)[:10], '%Y-%m-%d').date()
    return timezone.make_aware(datetime.combine(dia, time(12, 0)))


class Command(BaseCommand):
    help = 'Importa o SQLite do zntt-control offline para a conta de um usuário.'

    def add_arguments(self, parser):
        parser.add_argument('--usuario', required=True)
        parser.add_argument('--sqlite', required=True)
        parser.add_argument('--pasta', required=True, help='Pasta de dados do app offline (logos/anexos).')
        parser.add_argument('--simular', action='store_true', help='Importa e desfaz no fim.')

    def handle(self, *args, **opts):
        if not os.path.isfile(opts['sqlite']):
            raise CommandError(f"SQLite não encontrado: {opts['sqlite']}")
        try:
            self.user = User.objects.get(username=opts['usuario'])
        except User.DoesNotExist:
            raise CommandError(f"Usuário não existe: {opts['usuario']}")
        self.pasta = opts['pasta']
        self.simular = opts['simular']
        self.faltando = []

        db = sqlite3.connect(opts['sqlite'])
        db.row_factory = sqlite3.Row
        self.db = db
        tabelas = {r[0] for r in db.execute("select name from sqlite_master where type='table'")}
        self.tem = tabelas.__contains__

        nomes = [r['name'] for r in db.execute('select name from projects')]
        repetidos = Project.all_objects.filter(criado_por=self.user, nome__in=nomes).values_list('nome', flat=True)
        if repetidos:
            raise CommandError(
                f'{self.user.username} já tem projeto(s) com esses nomes: {", ".join(repetidos)}. '
                'Parece que a importação já foi feita.'
            )

        try:
            with transaction.atomic():
                totais = self.importar()
                if opts['simular']:
                    raise Simulacao()
        except Simulacao:
            self.stdout.write(self.style.WARNING('SIMULAÇÃO — nada foi gravado.'))

        for nome, n in totais.items():
            self.stdout.write(f'  {nome:<14} {n}')
        if self.faltando:
            self.stdout.write(self.style.WARNING(f'Arquivos não encontrados ({len(self.faltando)}):'))
            for f in self.faltando:
                self.stdout.write(f'  {f}')
        if not opts['simular']:
            self.stdout.write(self.style.SUCCESS(f'Importado para {self.user.username}.'))

    # ── helpers ─────────────────────────────────────────────────────────────
    def rows(self, sql):
        return list(self.db.execute(sql))

    def arquivo(self, relativo):
        """Abre um arquivo da pasta do app offline; None se não existir."""
        if not relativo:
            return None
        caminho = relativo if os.path.isabs(relativo) else os.path.join(self.pasta, relativo)
        caminho = caminho.replace('\\', '/')
        if not os.path.isfile(caminho):
            self.faltando.append(relativo)
            return None
        return open(caminho, 'rb')

    def datas(self, model, pk, **campos):
        """Preserva as datas originais (auto_now/auto_now_add ignorariam)."""
        model._base_manager.filter(pk=pk).update(**{k: v for k, v in campos.items() if v})

    # ── importação ──────────────────────────────────────────────────────────
    def importar(self):
        u = self.user
        totais = {}

        categorias = {}
        for r in self.rows('select * from categories'):
            cat, _ = Category.objects.get_or_create(nome=r['name'], criado_por=u)
            categorias[r['id']] = cat
        totais['categorias'] = len(categorias)

        tags = {}
        if self.tem('tags'):
            for r in self.rows('select * from tags'):
                tag, _ = Tag.objects.get_or_create(nome=r['name'], criado_por=u, defaults={'cor': r['color']})
                tags[r['id']] = tag
        totais['tags'] = len(tags)

        projetos = {}
        logos = 0
        for r in self.rows('select * from projects order by id'):
            p = Project.objects.create(
                nome=r['name'], cor=r['color'] or '#7c6af7', criado_por=u,
                categoria=categorias.get(r['category_id']),
                status=STATUS.get(r['status'], 'ativo'),
            )
            f = self.arquivo(r['logo_path'])
            if f:
                with f:
                    # Na simulação não grava arquivo: o rollback não apagaria do disco.
                    if not self.simular:
                        p.logo.save(os.path.basename(r['logo_path']), File(f), save=True)
                logos += 1
            arquivado = r['archived_at'] if 'archived_at' in r.keys() else None
            self.datas(Project, p.pk, criado_em=utc(r['created_at']), atualizado_em=utc(r['updated_at']),
                       deletado_em=utc(arquivado))
            projetos[r['id']] = p
        totais['projetos'] = len(projetos)
        totais['logos'] = logos

        if self.tem('project_tags'):
            for r in self.rows('select * from project_tags'):
                if r['project_id'] in projetos and r['tag_id'] in tags:
                    projetos[r['project_id']].tags.add(tags[r['tag_id']])

        colunas = {}
        for r in self.rows('select * from columns order by project_id, position'):
            if r['project_id'] not in projetos:
                continue
            c = Column.objects.create(
                projeto=projetos[r['project_id']], nome=r['name'],
                posicao=r['position'] or 0, is_done_column=bool(r['is_done_column']),
            )
            self.datas(Column, c.pk, criado_em=utc(r['created_at']))
            colunas[r['id']] = c
        totais['colunas'] = len(colunas)

        tasks = {}
        for r in self.rows('select * from tasks order by id'):
            projeto, coluna = projetos.get(r['project_id']), colunas.get(r['column_id'])
            if not projeto:
                continue
            t = Task.objects.create(
                titulo=r['title'][:255], descricao=r['description'], criado_por=u,
                prioridade=PRIORIDADE.get(r['priority'], ''), data_limite=prazo(r['due_date']),
                projeto=projeto, coluna=coluna, posicao=r['position'] or 0,
            )
            arquivada = r['archived_at'] if 'archived_at' in r.keys() else None
            self.datas(Task, t.pk, criado_em=utc(r['created_at']), atualizado_em=utc(r['updated_at']),
                       deletado_em=utc(arquivada))
            tasks[r['id']] = t
        totais['tasks'] = len(tasks)

        n = 0
        for r in self.rows('select * from subtasks order by task_id, position'):
            if r['task_id'] in tasks:
                s = Subtask.objects.create(task=tasks[r['task_id']], titulo=r['title'][:255],
                                           concluida=bool(r['completed']), posicao=r['position'] or 0)
                self.datas(Subtask, s.pk, criado_em=utc(r['created_at']))
                n += 1
        totais['subtarefas'] = n

        n = 0
        tem_posicao = 'position' in [c[1] for c in self.db.execute('pragma table_info(attachments)')]
        for r in self.rows('select * from attachments order by task_id, id'):
            f = self.arquivo(r['file_path']) if r['task_id'] in tasks else None
            if not f:
                continue
            with f:
                a = Attachment(task=tasks[r['task_id']], nome_original=r['original_name'],
                               mime_type=r['mime_type'] or mimetypes.guess_type(r['original_name'])[0],
                               tamanho_bytes=r['size_bytes'], posicao=(r['position'] if tem_posicao else 0) or 0)
                if self.simular:
                    a.arquivo.name = r['filename'] or r['original_name']
                    a.save()
                else:
                    a.arquivo.save(r['filename'] or r['original_name'], File(f), save=True)
            self.datas(Attachment, a.pk, criado_em=utc(r['created_at']))
            n += 1
        totais['anexos'] = n

        if self.tem('task_tags'):
            for r in self.rows('select * from task_tags'):
                if r['task_id'] in tasks and r['tag_id'] in tags:
                    tasks[r['task_id']].tags.add(tags[r['tag_id']])

        n = 0
        if self.tem('task_activity'):
            for r in self.rows('select * from task_activity order by id'):
                if r['task_id'] not in tasks or r['type'] not in ActivityType.values:
                    continue
                antigo, novo = r['old_value'], r['new_value']
                if r['field'] == 'priority':
                    antigo, novo = PRIORIDADE.get(antigo, antigo), PRIORIDADE.get(novo, novo)
                campo = CAMPO.get(r['field'], r['field'])
                if r['type'] == ActivityType.SUBTASK_TOGGLED:
                    campo, antigo = None, r['field']  # API guarda o título em valor_antigo
                TaskActivity.objects.create(
                    task=tasks[r['task_id']], tipo=r['type'], campo=(campo or None) and campo[:30],
                    valor_antigo=antigo, valor_novo=novo, usuario=u, ocorrido_em=utc(r['created_at']),
                )
                n += 1
        totais['historico'] = n

        n = 0
        if self.tem('time_entries'):
            for r in self.rows('select * from time_entries order by id'):
                if r['task_id'] in tasks:
                    TimeEntry.objects.create(task=tasks[r['task_id']], usuario=u, inicio=utc(r['started_at']),
                                             fim=utc(r['ended_at']), nota=r['note'])
                    n += 1
        totais['tempos'] = n

        n = 0
        if self.tem('project_templates'):
            for r in self.rows('select * from project_templates'):
                cols = [{'nome': c['name'], 'posicao': c['position'], 'is_done_column': bool(c['is_done_column'])}
                        for c in self.db.execute('select * from template_columns where template_id = ? '
                                                 'order by position', (r['id'],))]
                tpl, criado = ProjectTemplate.objects.get_or_create(
                    nome=r['name'], criado_por=u, defaults={'colunas': cols})
                if criado:
                    for t in self.db.execute('select tag_id from template_tags where template_id = ?', (r['id'],)):
                        if t['tag_id'] in tags:
                            tpl.tags.add(tags[t['tag_id']])
                    n += 1
        totais['modelos'] = n

        cfg = {r['key']: r['value'] for r in self.rows('select * from app_settings')}
        settings, _ = UserSettings.objects.get_or_create(usuario=u)
        if cfg.get('theme'):
            settings.tema = cfg['theme'][:20]
        if cfg.get('accent'):
            settings.cor_accent = cfg['accent'][:7]
        prefs = dict(settings.preferencias or {})
        for chave in ('font', 'locale'):
            if cfg.get(chave):
                prefs[chave] = cfg[chave]
        settings.preferencias = prefs
        settings.save()
        totais['preferencias'] = ', '.join(f'{k}={v}' for k, v in cfg.items()
                                           if k in ('theme', 'accent', 'font', 'locale'))
        return totais
