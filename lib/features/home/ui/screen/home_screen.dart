import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';
import 'package:todo_list_app/core/shared/ui/my_scaffold/my_scaffold.dart';
import 'package:todo_list_app/core/shared/ui/my_scaffold/scaffold_params.dart';
import 'package:todo_list_app/features/home/application/home_cubit.dart';
import 'package:todo_list_app/features/home/application/home_state.dart';
import 'package:todo_list_app/features/home/ui/utils/show_edit_dialog.dart';
import 'package:todo_list_app/features/home/ui/widget/home_drawer.dart';
import 'package:todo_list_app/features/home/ui/widget/menu_button.dart';
import 'package:todo_list_app/features/home/ui/widget/task_list.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, HomeCubit? homeCubit}) : _homeCubit = homeCubit;

  final HomeCubit? _homeCubit;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    (widget._homeCubit ?? getIt<HomeCubit>()).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocScaffold<HomeCubit, HomeState, HomeState>(
      bloc: widget._homeCubit,
      loadingSpinnerType: LoadingSpinnerType.fullSizeBody,
      appBar: AppBar(
        leading: const MenuButton(),
        backgroundColor: context.colors.primary,
      ),
      loadingStateDiscriminator: (state) => state.isLoading,
      bodyBlocBuilder: (context, state) {
        if (state.tasks.isEmpty) {
          return Center(
            child: Text(context.l10n.noCurrentTasks),
          );
        }
        return TaskList(tasks: state.tasks);
      },
      scaffoldAdditionalParams: const ScaffoldParams(
        drawer: HomeDrawer(),
        floatingActionButton: HomeFloatingActionButton(),
      ),
    );
  }
}

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.colors.primary,
      foregroundColor: context.colors.onPrimary,
      shape: const CircleBorder(),
      onPressed: () {
        context.showEditDialog();
      },
      child: const Icon(Icons.add),
    );
  }
}
