part of 'my_scaffold.dart';

/// The type of loading spinner to be shown.
///
/// [fullScreenStacked] will show the loading spinner on top of the scaffold.
/// [fullSizeBody] will show the loading spinner as the body of the scaffold.
/// [none] will not show the loading spinner.
enum LoadingSpinnerType {
  fullScreenStacked,
  fullSizeBody,
  none,
}

/// WARNING: IF YOU USE THIS WIDGET BE SURE TO BE USING GET_IT PACKAGE
///
/// A customized Scaffold that enhances the use of BLoC pattern.
///
/// B is the type of the BLoC to be used.
/// S is the type of the state of the BLoC.
/// L is the type of the state that will trigger the loading spinner.
///
/// If [bloc] is provided, the BLoC will be used. If not, the BLoC will be obtained from
/// the [GetIt] instance.
///
/// If [blocListener] is not provided, the scaffold will not listen to the BLoC state changes.
///
/// [loadingStateDiscriminator] is an optional parameter to indicate the state that will trigger the loading
/// spinner. This is useful for when the loading state does not have a specific type.
class BlocScaffold<B extends BlocBase<S>, S, L extends S> extends _MyScaffold {
  /// A customized Scaffold that enhances the use of BLoC pattern.
  const BlocScaffold({
    super.key,
    this.bloc,
    this.loadingStateDiscriminator,
    this.blocListener,
    this.listenWhen,
    this.loadingSpinnerType = LoadingSpinnerType.fullScreenStacked,
    this.bodyBlocBuilder,
    this.loadingBody,
    this.buildWhen,
    super.appBar,
    super.useDefaultAppBar = true,
    super.defaultAppBarTitle,
    super.body,
    super.scaffoldAdditionalParams,
    super.bodyPadding,
  }) : assert(
          !(body != null && bodyBlocBuilder != null),
          'You can only provide one of the body or bodyBlocBuilder parameters.',
        );

  ///The BLoC to be used. If not provided, the BLoC will be obtained from the [GetIt] instance.
  ///
  /// WARNING: IF YOU USE THIS WIDGET BE SURE TO BE USING GET_IT PACKAGE
  ///
  /// Be aware that if you provide a BLoC, you will have to dispose it manually.
  final B? bloc;

  ///Normally you would declare the L type as the loading state, but if you have a
  ///more complex state, you can use this function to discriminate the loading state.
  ///If not provided, the loading state will be the state of type L.
  ///
  ///example:
  ///```dart
  ///class MyState {
  ///  final bool isLoading;
  ///}
  ///
  ///loadingStateDiscriminator: (state) => state.isLoading
  ///```
  ///
  /// This will indicate that the loading state is when the isLoading property is true.
  /// If the property is false, the loading spinner will not be shown.
  final bool Function(S state)? loadingStateDiscriminator;

  ///The type of loading spinner to be shown if any.
  final LoadingSpinnerType loadingSpinnerType;

  ///Optional function to be called when the BLoC state changes.
  final void Function(BuildContext context, S state)? blocListener;

  ///Optional depuration function to indicate when the listener should be called.
  final bool Function(S previousState, S currentState)? listenWhen;

  ///Optional depuration function to indicate when the builder should be called.
  final bool Function(S previousState, S currentState)? buildWhen;

  ///Optional function to be called when the BLoC state changes.
  final Widget Function(BuildContext context, S state)? bodyBlocBuilder;

  ///Optional loading body that replaces the default loading spinner.
  ///
  ///!!!IMPORTANT!!!: If you want to provide loading body. BE SURE to set the [loadingSpinnerType] to [LoadingSpinnerType.none].
  ///Otherwise it will be ignored.
  final Widget? loadingBody;

  Widget get _body {
    if (bodyBlocBuilder != null) {
      //If the bodyBlocBuilder is provided, it will be used. This is useful when you want to use the BLoC state to build the entire body.
      return BlocBuilder<B, S>(
        //Key to force the rebuild of the widget when the loading spinner is shown or hidden.
        key: UniqueKey(),
        buildWhen: (previous, current) {
          //If the buildWhen function is provided, it will be used.
          final result = buildWhen?.call(previous, current) ??
              //Else, the default behavior is to rebuild the widget when the loading spinner is shown or hidden.
              //This prevents resource leaks since it will only rebuild when a transition from loading to not loading happens.
              !isLoading(current) && previous != current;
          return result;
        },
        builder: (context, state) {
          return bodyBlocBuilder!.call(context, state);
        },
      );
    }
    //If the bodyBlocBuilder is not provided, the body will be used directly and the loading building will be done on top of it.
    return body ?? const SizedBox.shrink();
  }

  ///Indicates if the state is a loading state.
  bool isLoading(S state) {
    return state is L &&
        //If the loadingStateDiscriminator is provided, it will be used.
        (loadingStateDiscriminator?.call(state) ?? true) &&
        //Assertion that there is something to show when loading.
        (loadingSpinnerType != LoadingSpinnerType.none || loadingBody != null);
  }

  bool _currentIsLoadingAndPreviousWasNtOrViceversa(
    S previousState,
    S currentState,
  ) {
    final result = isLoading(currentState) != isLoading(previousState);
    return result;
  }

  bool _previousDifferentFromCurrent(S previousState, S currentState) {
    return previousState != currentState;
  }

  bool _defaultListenWhen(S previousState, S currentState) {
    if (listenWhen != null) {
      return listenWhen!.call(previousState, currentState);
    } else if (blocListener != null) {
      return _previousDifferentFromCurrent(previousState, currentState);
    }
    return false;
  }

  void Function(BuildContext context, S state)
      get _defaultBlocListenerFunction {
    ///If the blocListener is provided, it will be used. Else, an empty function will be returned.
    return blocListener ?? (_, __) {};
  }

  @override
  Widget build(BuildContext context) {
    //If the BLoC is provided, it will be used. Else, it will be obtained from the GetIt instance.
    return bloc != null
        ? BlocProvider<B>.value(
            value: bloc!,
            child: _buildContent(context),
          )
        : BlocProvider<B>(
            create: (_) => GetIt.instance<B>(),
            child: _buildContent(context),
          );
  }

  Widget _buildContent(BuildContext context) {
    return switch (loadingSpinnerType) {
      ///If the loading spinner is fullScreenStacked, the scaffold will be built with a stack that superposes the loading spinner on top of the scaffold.
      LoadingSpinnerType.fullScreenStacked =>
        _buildScaffoldThatSuperposesSpinnerOnDesignatedLoadingState(context),

      ///If the loading spinner is fullSizeBody, the scaffold will be built with the loading spinner as the body of the scaffold.
      LoadingSpinnerType.fullSizeBody => _buildScaffoldWithCustomLoadingBody(
          context,
          loadingBody: const Center(
            child: AdaptiveSpinner(),
          ),
        ),

      ///If the loading spinner is none, we check if there is a loading body to be shown. If not, we build the scaffold with only the listener.
      ///If there is a loading body, we build the scaffold with the custom loading body.
      LoadingSpinnerType.none => loadingBody == null
          ? _buildScaffoldWithListenerOnly(context)
          : _buildScaffoldWithCustomLoadingBody(
              context,
              loadingBody: loadingBody!,
            ),
    };
  }

  Widget _buildScaffoldWithCustomLoadingBody(
    BuildContext context, {
    required Widget loadingBody,
  }) {
    return BlocListener<B, S>(
      listenWhen: _defaultListenWhen,
      listener: _defaultBlocListenerFunction,
      child: _build(
        context,
        body: BlocBuilder<B, S>(
          key: UniqueKey(),
          buildWhen: _currentIsLoadingAndPreviousWasNtOrViceversa,
          builder: (context, state) {
            if (isLoading(state)) {
              return loadingBody;
            }
            return _body;
          },
        ),
      ),
    );
  }

  Widget _buildScaffoldThatSuperposesSpinnerOnDesignatedLoadingState(
    BuildContext context,
  ) =>
      BlocConsumer<B, S>(
        listenWhen: _defaultListenWhen,
        listener: _defaultBlocListenerFunction,
        buildWhen: _currentIsLoadingAndPreviousWasNtOrViceversa,
        builder: (_, state) => Stack(
          children: [
            _build(context),
            if (isLoading(state))
              const Positioned.fill(
                child: AdaptiveSpinnerDialog(),
              ),
          ],
        ),
      );

  Widget _buildScaffoldWithListenerOnly(BuildContext context) =>
      BlocListener<B, S>(
        listener: _defaultBlocListenerFunction,
        child: Builder(
          builder: _build,
        ),
      );

  Widget _build(BuildContext context, {Widget? body}) {
    return Builder(
      builder: (context) {
        return MyScaffold(
          appBar: appBar,
          useDefaultAppBar: useDefaultAppBar,
          defaultAppBarTitle: defaultAppBarTitle,
          body: body ?? _body,
          scaffoldAdditionalParams: scaffoldAdditionalParams,
          bodyPadding: super.bodyPadding,
        );
      },
    );
  }
}
