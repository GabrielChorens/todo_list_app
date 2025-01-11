import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/shared/ui/my_scaffold/my_scaffold.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class ConnectionError extends StatelessWidget {
  ///Screen that shows a connection error message and an animation
  const ConnectionError({
    required PreferredSizeWidget appbar,
    super.key,
  }) : _appbar = appbar;

  //Ideally the appbar of the previous screen should be passed here so it maintains the same style
  final PreferredSizeWidget _appbar;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: _appbar,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 80,
        ),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              context.l10n.connectionError,
            ),
            const _ConnectionErrorImage(),
            SizedBox(
              width: 270,
              child: Text(
                context.l10n.connectionErrorDetail,
                softWrap: true,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: 190,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop<bool>(true);
                  },
                  child: Text(context.l10n.retry),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConnectionErrorImage extends StatelessWidget {
  const _ConnectionErrorImage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        CupertinoIcons.wifi_slash,
        size: 100,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
