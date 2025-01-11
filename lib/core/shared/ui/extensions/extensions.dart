import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateX on DateTime {
  String toFormattedString(BuildContext context) {
    return DateFormat(
      'EEE d MMM, HH:mm a',
      Localizations.localeOf(context).languageCode,
    ).format(this);
  }
}

extension ColorSchemeX on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
