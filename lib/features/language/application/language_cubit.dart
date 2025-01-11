import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list_app/features/language/data/repository/storage_service.dart';

///Cubit that manages the language state of the app and its storage.
@singleton
class LanguageCubit extends Cubit<Locale> {
  LanguageCubit(this._languageStorageRepository) : super(const Locale('es')) {
    initialize();
  }
  final LanguageCodeRepository _languageStorageRepository;

  void initialize() {
    //Check if the saved language is different from the current language and update it.
    final savedLanguage = _languageStorageRepository.getLanguageCode();

    if (savedLanguage != state.languageCode) {
      if (savedLanguage != null) {
        emit(Locale(savedLanguage));
      } else {
        _languageStorageRepository.saveLanguageCode(state.languageCode);
      }
    }
  }

  void changeLanguage(Locale locale) {
    emit(locale);
    _languageStorageRepository.saveLanguageCode(locale.languageCode);
  }
}
