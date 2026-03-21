import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../features/authentication/presentation/cubit/users_cubit.dart';
import '../../../../../shared/widgets/app_primary_button.dart';
import '../../../../../shared/widgets/app_text_button.dart';
import '../../../../../shared/widgets/app_text_field.dart';
import '../../../domain/entities/task.dart';
import 'filter_date_range_row.dart';
import 'filter_priority_section.dart';
import 'filter_user_section.dart';

class TaskFilterResult {
  final TaskPriority? prioridade;
  final String? search;
  final int? criadoPor;
  final int? atribuidoPara;
  final DateTime? criadoEmInicio;
  final DateTime? criadoEmFim;
  final DateTime? dataLimiteInicio;
  final DateTime? dataLimiteFim;

  const TaskFilterResult({
    this.prioridade,
    this.search,
    this.criadoPor,
    this.atribuidoPara,
    this.criadoEmInicio,
    this.criadoEmFim,
    this.dataLimiteInicio,
    this.dataLimiteFim,
  });

  bool get hasActiveFilters =>
      prioridade != null ||
      (search != null && search!.isNotEmpty) ||
      criadoPor != null ||
      atribuidoPara != null ||
      criadoEmInicio != null ||
      criadoEmFim != null ||
      dataLimiteInicio != null ||
      dataLimiteFim != null;
}

class FilterBottomSheet extends StatefulWidget {
  final TaskFilterResult current;

  const FilterBottomSheet({super.key, required this.current});

  static Future<TaskFilterResult?> show(
    BuildContext context, {
    required TaskFilterResult current,
  }) {
    return showModalBottomSheet<TaskFilterResult>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<UsersCubit>(),
        child: FilterBottomSheet(current: current),
      ),
    );
  }

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late TaskPriority? _prioridade;
  late TextEditingController _searchController;
  late int? _criadoPor;
  late int? _atribuidoPara;
  late DateTime? _criadoEmInicio;
  late DateTime? _criadoEmFim;
  late DateTime? _dataLimiteInicio;
  late DateTime? _dataLimiteFim;

  static final _anyTime = DateTime(2020);
  static final _farFuture = DateTime(2100);

  @override
  void initState() {
    super.initState();
    final c = widget.current;
    _prioridade = c.prioridade;
    _searchController = TextEditingController(text: c.search ?? '');
    _criadoPor = c.criadoPor;
    _atribuidoPara = c.atribuidoPara;
    _criadoEmInicio = c.criadoEmInicio;
    _criadoEmFim = c.criadoEmFim;
    _dataLimiteInicio = c.dataLimiteInicio;
    _dataLimiteFim = c.dataLimiteFim;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _apply() {
    Navigator.pop(
      context,
      TaskFilterResult(
        prioridade: _prioridade,
        search: _searchController.text.trim().isEmpty ? null : _searchController.text.trim(),
        criadoPor: _criadoPor,
        atribuidoPara: _atribuidoPara,
        criadoEmInicio: _criadoEmInicio,
        criadoEmFim: _criadoEmFim,
        dataLimiteInicio: _dataLimiteInicio,
        dataLimiteFim: _dataLimiteFim,
      ),
    );
  }

  void _clear() => setState(() {
        _prioridade = null;
        _searchController.clear();
        _criadoPor = null;
        _atribuidoPara = null;
        _criadoEmInicio = null;
        _criadoEmFim = null;
        _dataLimiteInicio = null;
        _dataLimiteFim = null;
      });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SafeArea(
        child: DraggableScrollableSheet(
          initialChildSize: 0.72,
          minChildSize: 0.5,
          maxChildSize: 0.72,
          expand: false,
          builder: (_, scrollController) => Column(
            children: [
              _SheetHandle(color: cs.outlineVariant),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Spacer(),
                    AppTextButton(
                      label: 'Limpar tudo',
                      onPressed: _clear,
                      color: cs.error,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  children: [
                    AppTextField(
                      controller: _searchController,
                      label: 'Busca',
                      hint: 'Buscar por título ou descrição...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close, size: 18),
                              onPressed: () => setState(() => _searchController.clear()),
                            )
                          : null,
                    ),
                    const SizedBox(height: 20),
                    FilterPrioritySection(
                      value: _prioridade,
                      onChanged: (v) => setState(() => _prioridade = v),
                    ),
                    const SizedBox(height: 20),
                    FilterUserSection(
                      criadoPor: _criadoPor,
                      atribuidoPara: _atribuidoPara,
                      onCriadoPorChanged: (v) => setState(() => _criadoPor = v),
                      onAtribuidoParaChanged: (v) => setState(() => _atribuidoPara = v),
                    ),
                    const SizedBox(height: 20),
                    FilterDateRangeRow(
                      label: 'Data de criação',
                      start: _criadoEmInicio,
                      end: _criadoEmFim,
                      firstDate: _anyTime,
                      lastDate: _farFuture,
                      onStartChanged: (v) => setState(() => _criadoEmInicio = v),
                      onEndChanged: (v) => setState(() => _criadoEmFim = v),
                    ),
                    const SizedBox(height: 20),
                    FilterDateRangeRow(
                      label: 'Prazo',
                      start: _dataLimiteInicio,
                      end: _dataLimiteFim,
                      firstDate: _anyTime,
                      lastDate: _farFuture,
                      onStartChanged: (v) => setState(() => _dataLimiteInicio = v),
                      onEndChanged: (v) => setState(() => _dataLimiteFim = v),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: AppPrimaryButton(
                    onPressed: _apply,
                    label: 'Aplicar filtros',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SheetHandle extends StatelessWidget {
  final Color color;
  const _SheetHandle({required this.color});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          width: 36,
          height: 4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );
}
