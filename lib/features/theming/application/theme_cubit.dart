import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/features/theming/application/theme_state.dart';
import 'package:todo_list_app/features/theming/data/theming_repository.dart';

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._themingRepository)
      : super(ThemeState.initial(_themingRepository.getTheme()));

  final ThemingRepository _themingRepository;

  void changeTheme(String themeName) {
    _themingRepository.setTheme(themeName);
    emit(
      ThemeState(
        selectedTheme:
            state.themes.where((element) => element.name == themeName).first,
      ),
    );
  }

  void toggleThemeMode() {
    final newThemeMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(themeMode: newThemeMode));
  }
}
