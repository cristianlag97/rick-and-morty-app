part of presentation.providers.episodes;

class EpisodeState {
  final bool isFilter;
  final bool isLoading;
  final int lastPage;
  final List<Result> results;
  final Map<String, Result> resultsMap;
  final Result? result;

  const EpisodeState({
    required this.lastPage,
    required this.results,
    this.isFilter = false,
    this.isLoading = false,
    this.result,
    this.resultsMap = const {},
  });

  EpisodeState copyWith({
    bool? isFilter,
    bool? isLoading,
    int? lastPage,
    List<Result>? results,
    Map<String, Result>? resultsMap,
    Result? result,
  }) =>
      EpisodeState(
        isFilter: isFilter ?? this.isFilter,
        isLoading: isLoading ?? this.isLoading,
        lastPage: lastPage ?? this.lastPage,
        result: result ?? this.result,
        results: results ?? this.results,
        resultsMap: resultsMap ?? this.resultsMap,
      );
}
