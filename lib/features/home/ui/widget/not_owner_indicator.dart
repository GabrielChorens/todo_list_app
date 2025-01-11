import 'package:flutter/material.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class NotOwnerIndicator extends StatelessWidget {
  const NotOwnerIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(

        text: '${context.l10n.owner}: ',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: context.l10n.other,
          ),
        ],
      ),
      textAlign: TextAlign.end,
    );
  }
}
