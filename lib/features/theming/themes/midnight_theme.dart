import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/features/theming/themes/theme_interface.dart';

class MidnightTheme implements ThemeInterface {

  @override
  final name = 'Midnight';
  @override
  final keyName = 'midnight';
  @override
  final ThemeData light = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xFF00296B),
      primaryContainer: Color(0xFFA0C2ED),
      primaryLightRef: Color(0xFF00296B),
      secondary: Color(0xFFD26900),
      secondaryContainer: Color(0xFFFFD270),
      secondaryLightRef: Color(0xFFD26900),
      tertiary: Color(0xFF5C5C95),
      tertiaryContainer: Color(0xFFC8DBF8),
      tertiaryLightRef: Color(0xFF5C5C95),
      appBarColor: Color(0xFFC8DCF8),
      error: Color(0x00000000),
      errorContainer: Color(0x00000000),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 15,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 20,
      inputDecoratorUnfocusedBorderIsColored: true,
      inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
      inputDecoratorSuffixIconSchemeColor: SchemeColor.onSecondaryFixed,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  @override
  final ThemeData dark = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xFFB1CFF5),
      primaryContainer: Color(0xFF3873BA),
      primaryLightRef: Color(0xFF00296B),
      secondary: Color(0xFFFFD270),
      secondaryContainer: Color(0xFFD26900),
      secondaryLightRef: Color(0xFFD26900),
      tertiary: Color(0xFFC9CBFC),
      tertiaryContainer: Color(0xFF535393),
      tertiaryLightRef: Color(0xFF5C5C95),
      appBarColor: Color(0xFF00102B),
      error: Color(0x00000000),
      errorContainer: Color(0x00000000),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 15,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 20,
      inputDecoratorUnfocusedBorderIsColored: true,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
