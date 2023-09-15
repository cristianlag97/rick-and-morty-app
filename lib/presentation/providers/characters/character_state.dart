part of presentation.providers.characters;

class CharacterState {
  final bool isFilter;
  final bool isLoading;
  final int lastPage;
  final List<Result> results;
  final Map<String, Result> resultsMap;
  final Result? result;

  const CharacterState({
    required this.lastPage,
    required this.results,
    this.isFilter = false,
    this.isLoading = false,
    this.result,
    this.resultsMap = const {},
  });

  CharacterState copyWith({
    bool? isFilter,
    bool? isLoading,
    int? lastPage,
    List<Result>? results,
    Map<String, Result>? resultsMap,
    Result? result,
  }) =>
      CharacterState(
        isFilter: isFilter ?? this.isFilter,
        isLoading: isLoading ?? this.isLoading,
        lastPage: lastPage ?? this.lastPage,
        result: result ?? this.result,
        results: results ?? this.results,
        resultsMap: resultsMap ?? this.resultsMap,
      );
}
