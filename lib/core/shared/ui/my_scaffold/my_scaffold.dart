import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list_app/core/shared/ui/my_scaffold/loading_spinners.dart';
import 'package:todo_list_app/core/shared/ui/my_scaffold/scaffold_params.dart';
import 'package:todo_list_app/core/shared/ui/widgets/my_app_bar.dart';
import 'package:todo_list_app/core/utils/async_cubit_state_management/cubit/async_cubit.dart';
import 'package:todo_list_app/core/utils/async_cubit_state_management/state/async_state.dart';
import 'package:todo_list_app/core/utils/async_cubit_state_management/utils/async_cubit_utils.dart';
import 'package:todo_list_app/core/utils/extensions/context_extensions.dart';

part 'async_scaffold.dart';
part 'bloc_scaffold.dart';

class MyScaffold extends _MyScaffold {
  const MyScaffold({
    super.key,
    super.appBar,
    super.useDefaultAppBar = true,
    super.defaultAppBarTitle = '',
    super.body,
    super.scaffoldAdditionalParams = const ScaffoldParams(),
    super.bodyPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          (useDefaultAppBar ? MyAppBar(title: defaultAppBarTitle) : null),
      body: Padding(
        padding: bodyPadding,
        child: body,
      ),
      floatingActionButton: scaffoldAdditionalParams.floatingActionButton,
      floatingActionButtonLocation:
          scaffoldAdditionalParams.floatingActionButtonLocation,
      floatingActionButtonAnimator:
          scaffoldAdditionalParams.floatingActionButtonAnimator,
      persistentFooterButtons: scaffoldAdditionalParams.persistentFooterButtons,
      persistentFooterAlignment:
          scaffoldAdditionalParams.persistentFooterAlignment,
      drawer: scaffoldAdditionalParams.drawer,
      onDrawerChanged: scaffoldAdditionalParams.onDrawerChanged,
      endDrawer: scaffoldAdditionalParams.endDrawer,
      onEndDrawerChanged: scaffoldAdditionalParams.onEndDrawerChanged,
      bottomNavigationBar: scaffoldAdditionalParams.bottomNavigationBar,
      bottomSheet: scaffoldAdditionalParams.bottomSheet,
      backgroundColor: scaffoldAdditionalParams.backgroundColor,
      resizeToAvoidBottomInset:
          scaffoldAdditionalParams.resizeToAvoidBottomInset,
      primary: scaffoldAdditionalParams.primary,
      drawerDragStartBehavior: scaffoldAdditionalParams.drawerDragStartBehavior,
      extendBody: scaffoldAdditionalParams.extendBody,
      extendBodyBehindAppBar: scaffoldAdditionalParams.extendBodyBehindAppBar,
      drawerScrimColor: scaffoldAdditionalParams.drawerScrimColor,
      drawerEdgeDragWidth: scaffoldAdditionalParams.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture:
          scaffoldAdditionalParams.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture:
          scaffoldAdditionalParams.endDrawerEnableOpenDragGesture,
      restorationId: scaffoldAdditionalParams.restorationId,
    );
  }
}

///MyScaffold Interface
class _MyScaffold extends StatelessWidget {
  const _MyScaffold({
    this.bodyPadding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    super.key,
    this.useDefaultAppBar = true,
    this.appBar,
    this.body,
    this.defaultAppBarTitle = '',
    this.scaffoldAdditionalParams = const ScaffoldParams(),
  });

  ///The app bar to be used on the scaffold. If not provided, and [useDefaultAppBar]
  ///is true, a default app bar will be used.
  final PreferredSizeWidget? appBar;

  final EdgeInsetsGeometry bodyPadding;

  ///The body of the scaffold.
  final Widget? body;

  ///If true, a default app bar will be used. If false, the app bar provided will be used if
  ///any or no app bar will be used if none is provided.
  final bool useDefaultAppBar;

  ///The title to be used on the default app bar if any. Default is an empty string.
  final String defaultAppBarTitle;

  ///The parameters of the scaffold native widget.
  ///If not provided, the default parameters will be used.
  final ScaffoldParams scaffoldAdditionalParams;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
