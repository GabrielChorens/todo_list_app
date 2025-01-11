import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_app/features/theming/themes/brand_blue_theme.dart';
import 'package:todo_list_app/features/theming/themes/green_forest_theme.dart';
import 'package:todo_list_app/features/theming/themes/midnight_theme.dart';
import 'package:todo_list_app/features/theming/themes/pink_sakura_theme.dart';
import 'package:todo_list_app/features/theming/themes/red_wine_theme.dart';
import 'package:todo_list_app/features/theming/themes/theme_interface.dart';

part 'theme_state.freezed.dart';

final _themes = IList<ThemeInterface>([
  BrandBlueTheme(),
  GreenForestTheme(),
  RedWineTheme(),
  MidnightTheme(),
  PinkSakuraTheme(),
]);

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeInterface selectedTheme,
    @Default(ThemeMode.light) ThemeMode themeMode,
  }) = _ThemeState;

  const ThemeState._();

  factory ThemeState.initial(String? themeName) {
    return ThemeState(
      selectedTheme: _themes.firstWhere(
        (theme) => theme.name == themeName,
        orElse: () => _themes.first,
      ),
    );
  }

  IList<ThemeInterface> get themes => _themes;
}
