class BaseState<T> {
  T? data;
  bool isLoading;

  BaseState({
    this.data,
    this.isLoading = false,
  });

  BaseState copyWith({
    T? data,
    bool? isLoading,
  }) =>
      BaseState(
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading,
      );
}
