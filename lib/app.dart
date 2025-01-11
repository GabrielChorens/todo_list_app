import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/routing/go_router.dart';
import 'package:todo_list_app/features/language/application/language_cubit.dart';
import 'package:todo_list_app/features/theming/application/theme_cubit.dart';
import 'package:todo_list_app/features/theming/application/theme_state.dart';
import 'package:todo_list_app/resources/l10n/gen_l10n/app_localizations.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({
    super.key,
    this.languageCubit,
    this.themeCubit,
  });

  final LanguageCubit? languageCubit;

  final ThemeCubit? themeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      bloc: languageCubit ?? getIt<LanguageCubit>(),
      builder: (context, locale) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          bloc: themeCubit ?? getIt<ThemeCubit>(),
          builder: (context, state) {
            return SafeArea(
              child: MaterialApp.router(
                locale: locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  ...AppLocalizations.localizationsDelegates,
                  FormBuilderLocalizations.delegate,
                ],
                routerConfig: router,
                themeMode: state.themeMode,
                theme: state.selectedTheme.light,
                darkTheme: state.selectedTheme.dark,
                title: 'Todo List App',
                debugShowCheckedModeBanner: false,
              ),
            );
          },
        );
      },
    );
  }
}
