import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';
import 'package:todo_list_app/features/theming/application/theme_cubit.dart';
import 'package:todo_list_app/features/theming/application/theme_state.dart';
import 'package:todo_list_app/features/theming/ui/widgets/theme_item.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class ThemeGalleryScreen extends StatelessWidget {
  const ThemeGalleryScreen({super.key, this.themeCubit});

  final ThemeCubit? themeCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.theme_gallery,
        ),
        foregroundColor: context.colors.onPrimary,
        backgroundColor: context.colors.primary,
        leading: BackButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(context.colors.onPrimary),
          ),
        ),
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        bloc: themeCubit ?? getIt<ThemeCubit>(),
        builder: (context, state) {
          return Flex(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.toggleThemeMode,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    BlocBuilder<ThemeCubit, ThemeState>(
                      bloc: themeCubit ?? getIt<ThemeCubit>(),
                      builder: (context, state) {
                        return Switch(
                          value: state.themeMode == ThemeMode.dark,
                          onChanged: (value) {
                            (themeCubit ?? getIt<ThemeCubit>())
                                .toggleThemeMode();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Divider(),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: state.themes.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final theme = state.themes[index];
                    final isSelected = theme.name == state.selectedTheme.name;
                    return ThemeItem(
                      theme: theme,
                      isSelected: isSelected,
                      onThemeSelected: () {
                        (themeCubit ?? getIt<ThemeCubit>())
                            .changeTheme(theme.name);
                      },
                      onImageTap: (imageIndex) {
                        _showFullScreenImage(
                          context,
                          theme.keyName,
                          imageIndex,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showFullScreenImage(
    BuildContext context,
    String themeName,
    int imageIndex,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset('assets/themes/${themeName}_$imageIndex.png'),
          ),
        );
      },
    );
  }
}
