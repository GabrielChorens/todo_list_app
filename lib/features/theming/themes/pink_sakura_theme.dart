import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/features/theming/themes/theme_interface.dart';

class PinkSakuraTheme implements ThemeInterface {
  @override
  final name = 'Pink Sakura';

  @override
  final keyName = 'pink_sakura';
  @override
  final ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.sakura,
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
    scheme: FlexScheme.sakura,
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
