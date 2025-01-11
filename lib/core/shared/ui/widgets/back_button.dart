import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ButtonStyle(
          side: WidgetStateProperty.all(
            const BorderSide(),
          ),
          shape: WidgetStateProperty.all(
            const CircleBorder(),
          ),
        ),
      ),
    );
  }
}
