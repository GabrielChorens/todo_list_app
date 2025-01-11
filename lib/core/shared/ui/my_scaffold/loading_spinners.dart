import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveSpinnerDialog extends StatelessWidget {
  const AdaptiveSpinnerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black.withAlpha(100),
      child: const Center(
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: AdaptiveSpinner(),
        ),
      ),
    );
  }
}

class AdaptiveSpinner extends StatelessWidget {
  const AdaptiveSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: switch (Theme.of(context).platform) {
        TargetPlatform.iOS => const CupertinoActivityIndicator(),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
