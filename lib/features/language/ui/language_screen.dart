import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/shared/ui/extensions/extensions.dart';
import 'package:todo_list_app/features/language/application/language_cubit.dart';
import 'package:todo_list_app/resources/l10n/gen_l10n/app_localizations.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

///Addition to manually change the app language
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.language),
        leading: BackButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(context.colors.onPrimary),
          ),
        ),
        backgroundColor: context.colors.primary,
        foregroundColor: context.colors.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: BlocBuilder<LanguageCubit, Locale>(
            bloc: getIt<LanguageCubit>(),
            builder: (context, locale) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField(
                    value: locale.languageCode.substring(0, 2),
                    items: () {
                      final locales =
                          AppLocalizations.supportedLocales.map((locale) {
                        return DropdownMenuItem(
                          value: locale.languageCode.substring(0, 2),
                          child: Text(localeTranslation(context, locale)),
                        );
                      }).toList();
                      return locales;
                    }(),
                    onChanged: (locale) {
                      final localeToChange = locale;
                      if (localeToChange != null) {
                        getIt<LanguageCubit>()
                            .changeLanguage(Locale(localeToChange));
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

///Translate locale.languageCode to the language name
String localeTranslation(BuildContext context, Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return context.l10n.english;
    case 'es':
      return context.l10n.spanish;
    default:
      return locale.languageCode;
  }
}
