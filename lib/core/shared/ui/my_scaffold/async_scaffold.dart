part of 'my_scaffold.dart';

/// WARNING: IF YOU USE THIS WIDGET BE SURE TO BE USING GET_IT PACKAGE
///
/// A customized Scaffold that enhances the use of BLoC pattern.
///
/// In this version, the a predefined state is used to indicate the loading state.
/// It requires the use of the [AsyncCubit] and [AsyncState] classes.
class AsyncScaffold<B extends AsyncCubit<L, R>, L, R>
    extends BlocScaffold<B, AsyncState<L, R>, AsyncState<L, R>> {
  /// A customized Scaffold that enhances the use of BLoC pattern.
  ///
  /// In this version, the a predefined state is used to indicate the loading state.
  /// It requires the use of the [AsyncCubit] and [AsyncState] classes.
  const AsyncScaffold({
    super.key,
    this.onSuccess,
    this.onError,
    super.loadingBody,
    super.loadingSpinnerType,
    super.bodyBlocBuilder,
    super.bloc,
    super.appBar,
    super.useDefaultAppBar = true,
    super.defaultAppBarTitle,
    super.body,
    super.scaffoldAdditionalParams,
    super.bodyPadding,
  });

  ///Function to be called when the state is a [Success].
  final void Function(BuildContext context, R data)? onSuccess;

  ///If not provided, the default error snackbar will be shown.
  final void Function(BuildContext context, L? error)? onError;

  @override
  bool isLoading(AsyncState<L, R> state) {
    return state is Loading &&
        (loadingSpinnerType != LoadingSpinnerType.none || loadingBody != null);
  }

  @override
  bool _currentIsLoadingAndPreviousWasNtOrViceversa(
    AsyncState<L, R> previousState,
    AsyncState<L, R> currentState,
  ) {
    final result = isLoading(currentState) != isLoading(previousState);
    return result;
  }

  @override
  Widget _buildScaffoldWithCustomLoadingBody(
    BuildContext context, {
    required Widget loadingBody,
  }) {
    return AsyncBlocListener<B, L, R>(
      listener: blocListenerFunction,
      child: _build(
        context,
        body: AsyncBlocBuilder<B, L, R>(
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

  @override
  Widget _buildScaffoldThatSuperposesSpinnerOnDesignatedLoadingState(
    BuildContext context,
  ) =>
      AsyncBlocConsumer<B, L, R>(
        listener: blocListenerFunction,
        buildWhen: _currentIsLoadingAndPreviousWasNtOrViceversa,
        builder: (context, state) => Stack(
          children: [
            _build(context),
            if (isLoading(state))
              const Positioned.fill(
                child: AdaptiveSpinnerDialog(),
              ),
          ],
        ),
      );

  @override
  Widget _buildScaffoldWithListenerOnly(BuildContext context) =>
      AsyncBlocListener<B, L, R>(
        listener: blocListenerFunction,
        child: Builder(
          builder: _build,
        ),
      );

  ///State listener function that calls the [onSuccess] or [onError] functions.
  void blocListenerFunction(
    BuildContext context,
    AsyncState<L, R> state,
  ) {
    state.maybeWhen(
      orElse: () {},
      success: (data) => onSuccess?.call(context, data),
      error: (error) {
        if (onError != null) {
          onError?.call(context, error);
        } else {
          context.showUnknownErrorSnackbar();
        }
      },
    );
  }
}
