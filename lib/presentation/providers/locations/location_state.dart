part of presentation.providers.location;

class LocationState {
  final bool isFilter;
  final bool isLoading;
  final int lastPage;
  final List<Result> results;
  final Map<String, Result> resultsMap;
  final Result? result;
  final String errorMessage;

  const LocationState({
    required this.lastPage,
    required this.results,
    this.errorMessage = '',
    this.isFilter = false,
    this.isLoading = false,
    this.result,
    this.resultsMap = const {},
  });

  LocationState copyWith({
    bool? isFilter,
    bool? isLoading,
    int? lastPage,
    List<Result>? results,
    Map<String, Result>? resultsMap,
    Result? result,
    String? errorMessage,
  }) =>
      LocationState(
        errorMessage: errorMessage ?? this.errorMessage,
        isFilter: isFilter ?? this.isFilter,
        isLoading: isLoading ?? this.isLoading,
        lastPage: lastPage ?? this.lastPage,
        result: result ?? this.result,
        results: results ?? this.results,
        resultsMap: resultsMap ?? this.resultsMap,
      );
}
