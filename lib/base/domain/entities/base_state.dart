import '../../data/models/api_error.dart';

class BaseState<T> {
  T? data;
  bool isLoading;
  ApiError? error;

  BaseState({
    this.data,
    this.isLoading = false,
    this.error,
  });

  BaseState<T> copyWith({
    T? data,
    bool? isLoading,
    ApiError? error,
  }) =>
      BaseState(
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}
