import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../features/authentication/domain/entities/user_summary.dart';
import '../../../../../features/authentication/presentation/cubit/users_cubit.dart';
import '../../../../../features/authentication/presentation/cubit/users_state.dart';
import '../../../../../shared/widgets/app_select_field.dart';

class FilterUserSection extends StatelessWidget {
  final int? criadoPor;
  final int? atribuidoPara;
  final ValueChanged<int?> onCriadoPorChanged;
  final ValueChanged<int?> onAtribuidoParaChanged;

  const FilterUserSection({
    super.key,
    required this.criadoPor,
    required this.atribuidoPara,
    required this.onCriadoPorChanged,
    required this.onAtribuidoParaChanged,
  });

  List<AppSelectOption<int?>> _userOptions(List<UserSummary> users) => [
        const AppSelectOption(value: null, label: 'Todos'),
        ...users.map((u) => AppSelectOption(value: u.id, label: u.displayName)),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final users = state is UsersLoaded ? state.users : <UserSummary>[];
        final loading = state is UsersLoading;

        return Column(
          children: [
            AppSelectField<int?>(
              label: 'Criado por',
              value: criadoPor,
              options: _userOptions(users),
              onChanged: onCriadoPorChanged,
              loading: loading,
            ),
            const SizedBox(height: 16),
            AppSelectField<int?>(
              label: 'Responsável',
              value: atribuidoPara,
              options: _userOptions(users),
              onChanged: onAtribuidoParaChanged,
              loading: loading,
            ),
          ],
        );
      },
    );
  }
}
