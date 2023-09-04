part of presentation.providers.episodes;

class EpisodeState {
  final int lastPage;
  final List<Result> results;
  final Map<String, Result> resultsMap;
  final Result? result;
  final bool isFilter;
  final bool isLoading;

  const EpisodeState({
    required this.lastPage,
    required this.results,
    this.result,
    this.isFilter = false,
    this.resultsMap = const {},
    this.isLoading = false,
  });

  EpisodeState copyWith({
    int? lastPage,
    List<Result>? results,
    Result? result,
    bool? isFilter,
    Map<String, Result>? resultsMap,
    bool? isLoading,
  }) =>
      EpisodeState(
        lastPage: lastPage ?? this.lastPage,
        results: results ?? this.results,
        result: result ?? this.result,
        isFilter: isFilter ?? this.isFilter,
        resultsMap: resultsMap ?? this.resultsMap,
        isLoading: isLoading ?? this.isLoading,
      );
}
