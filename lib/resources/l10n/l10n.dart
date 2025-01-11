import 'package:flutter/widgets.dart';
import 'package:todo_list_app/resources/l10n/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
