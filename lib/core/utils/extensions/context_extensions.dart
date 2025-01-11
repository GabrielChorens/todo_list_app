import 'package:flutter/material.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

extension SizeX on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  void showUnknownErrorSnackbar({
    Duration duration = const Duration(seconds: 3),
  }) {
    return showSnackbar(
      titleText: l10n.anUnexpectedErrorOccurred,
    );
  }

  ///Shows a snackbar with the given [titleText]
  ///If [buttonText] and [buttonAction] are provided, it will show a button with the given text
  void showSnackbar({
    required String titleText,
    String? buttonText,
    Duration duration = const Duration(seconds: 4),
    VoidCallback? buttonAction,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        dismissDirection: DismissDirection.horizontal,
        content: Row(
          children: [
            Expanded(
              child: Text(
                titleText,
                softWrap: true,
              ),
            ),
            if (buttonText != null && buttonAction != null)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(this).hideCurrentSnackBar();
                    buttonAction();
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(),
                      ),
                    ),
                  ),
                  child: Text(buttonText),
                ),
              ),
          ],
        ),
        duration: duration,
      ),
    );
  }
}
