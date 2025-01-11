import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/core/shared/ui/my_scaffold/my_scaffold.dart';
import 'package:todo_list_app/features/dashboard/application/dashboard_cubit.dart';
import 'package:todo_list_app/features/dashboard/ui/widgets/tasks_resume.dart';
import 'package:todo_list_app/features/dashboard/ui/widgets/user_list_item.dart';
import 'package:todo_list_app/features/home/application/home_cubit.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen(
      {super.key,
      this.dashboardCubit,
      this.homeCubit,
      this.coreControllerCubit});

  final DashboardCubit? dashboardCubit;
  final HomeCubit? homeCubit;
  final CoreControllerCubit? coreControllerCubit;
  @override
  Widget build(BuildContext context) {
    return AsyncScaffold<DashboardCubit, AppExceptions, IList<User>>(
      bloc: dashboardCubit,
      defaultAppBarTitle: context.l10n.dashboard,
      bodyBlocBuilder: (context, state) {
        return Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TasksResume(
              homeCubit: homeCubit,
              coreControllerCubit: coreControllerCubit,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 16,
              ),
              child: Text(
                context.l10n.users,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Divider(),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: state.data?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final user = state.data?[index];
                  return user != null
                      ? UserListItem(user: user)
                      : const SizedBox();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
