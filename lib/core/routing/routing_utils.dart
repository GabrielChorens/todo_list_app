part of 'go_router.dart';

/// Extracts a require path parameter by its [key], if the key is not found an exception is thrown.
/// This prevents navigation to screens that require a parameter.
///```
/// pageBuilder: (context, state) {
///     final identifier = pathParameterFromState(state, 'id');
///         return adaptivePageRoute(
///            key: state.pageKey,
///            child: PendingPayment(identifier: identifier,),
///         );
///},
///```
String pathParameterFromState(
  GoRouterState routerState,
  String key, [
  String? orElse,
]) {
  if (routerState.pathParameters.containsKey(key)) {
    return routerState.pathParameters[key]!;
  } else {
    if (orElse != null) return orElse;
    throw NavigationException<String>.pathParameter(
      path: routerState.fullPath ?? '',
      missingParameter: key,
    );
  }
}

class NavigationException<T> implements Exception {
  // ignore: avoid_unused_constructor_parameters
  NavigationException._({required String path, required String message})
      : message = 'GoRouter Route [$path] requires an extra parameter of type $T. '
            'Remember to pass an object of type $T : `context.go("$path",extra: object)` ';

  factory NavigationException.extra({required String path}) =>
      NavigationException._(
        path: path,
        message:
            'GoRouter Route [$path] requires an extra parameter of type $T. '
            'Remember to pass an object of type $T : `context.go("$path",extra: object)` ',
      );

  factory NavigationException.pathParameter({
    required String path,
    required String missingParameter,
  }) =>
      NavigationException._(
        path: path,
        message:
            'GoRouter Route [$path] requires a path parameter "$missingParameter" '
            'Remember to pass a Map entry : `context.go("$path",pathParameters: {"$missingParameter": "value"})` ',
      );
  final String message;
}

/// A route that uses the [adaptivePageRoute].
GoRoute standardRoute({
  required String path,
  String? name,
  Widget Function(BuildContext, GoRouterState)? pageCreator,
  Widget? page,
  List<RouteBase>? routes,
  bool maintainState = true,
  FutureOr<dynamic> Function(BuildContext, GoRouterState)? redirect,
}) =>
    GoRoute(
      path: path,
      name: name,
      pageBuilder: (context, state) => adaptivePageRoute<void>(
        key: state.pageKey,
        maintainState: maintainState,
        child: pageCreator != null
            ? pageCreator(context, state)
            : page ?? const SizedBox(),
      ),
      routes: routes ?? [],
    );

/// A route that uses the [slideTransitionPage].
///
/// On navigation, the page slides in from the right.
/// On back navigation, the page slides out to the right.
GoRoute horizontalTransitionRoute({
  required String path,
  String? name,
  Widget Function(BuildContext, GoRouterState)? pageCreator,
  Widget? page,
  List<RouteBase>? routes,
  bool maintainState = true,
  FutureOr<dynamic> Function(BuildContext, GoRouterState)? redirect,
}) =>
    GoRoute(
      path: path,
      name: name,
      pageBuilder: (context, state) => slideTransitionPage(
        key: state.pageKey,
        maintainState: maintainState,
        child: pageCreator != null
            ? pageCreator(context, state)
            : page ?? const SizedBox(),
      ),
      routes: routes ?? [],
    );

/// A route that uses the [slideTransitionPage].
/// On navigation, the page slides in from the bottom.
/// On back navigation, the page slides out to the bottom.
GoRoute verticalTransitionRoute({
  required String path,
  String? name,
  Widget Function(BuildContext, GoRouterState)? pageCreator,
  Widget? page,
  List<RouteBase>? routes,
  bool maintainState = true,
  FutureOr<dynamic> Function(BuildContext, GoRouterState)? redirect,
}) =>
    GoRoute(
      path: path,
      name: name,
      pageBuilder: (context, state) => slideTransitionPage(
        key: state.pageKey,
        maintainState: maintainState,
        offset: const Offset(0, 1),
        child: pageCreator != null
            ? pageCreator(context, state)
            : page ?? const SizedBox(),
      ),
      routes: routes ?? [],
    );

/// Adaptive route that uses cupertino pages on iOS and macos, no transitions on web and material on the rest of the
/// platforms.
Page<T> adaptivePageRoute<T>({
  required LocalKey key,
  required Widget child,
  bool maintainState = true,
  bool fullscreenDialog = false,
  bool allowSnapshotting = true,
  String? name,
  String? title,
  Object? arguments,
  String? restorationId,
}) {
  final iosPlatforms = [TargetPlatform.iOS, TargetPlatform.macOS];
  if (iosPlatforms.contains(defaultTargetPlatform)) {
    return CupertinoPage<T>(
      key: key,
      child: child,
      name: name,
      title: title,
      allowSnapshotting: allowSnapshotting,
      arguments: arguments,
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
      restorationId: restorationId,
    );
  }
  if (kIsWeb) {
    return NoTransitionPage(
      child: child,
      restorationId: restorationId,
      arguments: arguments,
      name: name,
      key: key,
    );
  }
  return MaterialPage<T>(
    key: key,
    child: child,
    name: name,
    allowSnapshotting: allowSnapshotting,
    arguments: arguments,
    fullscreenDialog: fullscreenDialog,
    maintainState: maintainState,
    restorationId: restorationId,
  );
}

Page<void> slideTransitionPage({
  required LocalKey key,
  required Widget child,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String? name,
  Object? arguments,
  String? restorationId,
  Offset offset = const Offset(1, 0),
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    name: name,
    arguments: arguments,
    fullscreenDialog: fullscreenDialog,
    maintainState: maintainState,
    restorationId: restorationId,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: offset,
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeIn)),
      ),
      child: child,
    ),
  );
}
