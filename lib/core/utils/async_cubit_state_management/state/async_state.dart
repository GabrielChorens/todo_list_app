import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

///Async state is a representation of the state of an async operation.
///
/// It can be in one of the following states:
/// - Initial: The initial state of the async operation.
/// - Loading: The async operation is in progress.
/// - Success: The async operation has been completed successfully. It contains the ´R´ data.
/// - Error: The async operation has failed. It may contain the ´L´ error or null.
///
/// The generic types `L` and `R` represent the Error and Success types respectively.
@freezed
sealed class AsyncState<L, R> with _$AsyncState<L, R> {
  const AsyncState._();

  const factory AsyncState.initial() = Initial;
  const factory AsyncState.loading() = Loading;
  const factory AsyncState.success({
    required R data,
  }) = Success;
  const factory AsyncState.error({
    L? error,
  }) = Error;

  bool get isInitial => maybeWhen(initial: () => true, orElse: () => false);
  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);
  bool get isSuccess => maybeWhen(success: (data) => true, orElse: () => false);
  bool get isError => maybeWhen(error: (error) => true, orElse: () => false);

  ///Returns the data if the state is a success state, otherwise returns null.
  R? get data => maybeWhen(success: (data) => data, orElse: () => null);

  ///Returns the error if the state is an error state, otherwise returns null.
  L? get error => maybeWhen(error: (error) => error, orElse: () => null);
}
