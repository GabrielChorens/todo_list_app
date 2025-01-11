import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/routing/go_router.dart';
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, this.coreControllerCubit});

  final CoreControllerCubit? coreControllerCubit;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: context.colors.secondary,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Todo List App',
                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                          color: context.colors.onSecondary,
                          fontWeightDelta: 2,
                        ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          ListTile(
            title: Text(context.l10n.dashboard),
            leading: Icon(
              Icons.dashboard,
              color: context.colors.primary,
            ),
            onTap: () {
              context.pushNamed(Routes.dashboard);
            },
          ),
          ListTile(
            title: Text(context.l10n.profile),
            leading: Icon(
              Icons.person,
              color: context.colors.primary,
            ),
            onTap: () {
              context.pushNamed(Routes.profile);
            },
          ),
          ListTile(
            title: Text(context.l10n.language),
            leading: Icon(
              Icons.translate,
              color: context.colors.primary,
            ),
            onTap: () {
              context.pushNamed(Routes.lang);
            },
          ),
          ListTile(
            title: Text(context.l10n.theme),
            leading: Icon(
              Icons.color_lens,
              color: context.colors.primary,
            ),
            onTap: () {
              context.pushNamed(Routes.themeSelection);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(context.l10n.logout),
            leading: Icon(
              Icons.logout,
              color: context.colors.primary,
            ),
            onTap: () {
              coreControllerCubit ??
                  getIt<CoreControllerCubit>().unauthenticate();
              context.goNamed(Routes.auth);
            },
          ),
        ],
      ),
    );
  }
}
