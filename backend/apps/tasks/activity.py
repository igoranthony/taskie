"""Registro do histórico detalhado (TaskActivity) usado pelo desktop."""
from .enums import ActivityType

# Texto longo (descrição) é cortado para o histórico não inchar o banco.
MAX_VALOR = 200

# Campos da task acompanhados no histórico (nomes da API).
CAMPOS_RASTREADOS = ('titulo', 'descricao', 'prioridade', 'data_limite')


def _clip(valor):
    if valor is None or valor == '':
        return None
    texto = str(valor)
    return texto if len(texto) <= MAX_VALOR else texto[:MAX_VALOR] + '…'


def valor_do_campo(task, campo):
    """Valor comparável/legível de um campo rastreado."""
    valor = getattr(task, campo)
    if campo == 'data_limite' and valor is not None:
        from django.utils import timezone
        return timezone.localtime(valor).date().isoformat()
    return valor


def registrar(task, tipo, campo=None, antigo=None, novo=None, usuario=None):
    from .models import TaskActivity

    if tipo not in ActivityType.values:
        raise ValueError(f'Tipo de atividade desconhecido: {tipo}')
    return TaskActivity.objects.create(
        task=task,
        tipo=tipo,
        campo=campo,
        valor_antigo=_clip(antigo),
        valor_novo=_clip(novo),
        usuario=usuario,
    )


def foto(task):
    """Valores atuais dos campos rastreados, para comparar depois de salvar."""
    return {campo: valor_do_campo(task, campo) for campo in CAMPOS_RASTREADOS}


def registrar_mudancas(task, antes, usuario):
    for campo in CAMPOS_RASTREADOS:
        velho, novo = antes.get(campo), valor_do_campo(task, campo)
        if (velho or None) != (novo or None):
            registrar(task, ActivityType.FIELD_CHANGED, campo, velho, novo, usuario)
