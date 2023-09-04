part of presentation.providers.characters;

class CharacterState {
  final int lastPage;
  final List<Result> results;
  final Map<String, Result> resultsMap;
  final Result? result;
  final bool isFilter;
  final bool isLoading;
  final String errorMessage;

  const CharacterState({
    required this.lastPage,
    required this.results,
    this.result,
    this.isFilter = false,
    this.resultsMap = const {},
    this.isLoading = false,
    this.errorMessage = '',
  });

  CharacterState copyWith({
    int? lastPage,
    List<Result>? results,
    Result? result,
    bool? isFilter,
    Map<String, Result>? resultsMap,
    bool? isLoading,
  }) =>
      CharacterState(
        lastPage: lastPage ?? this.lastPage,
        results: results ?? this.results,
        result: result ?? this.result,
        isFilter: isFilter ?? this.isFilter,
        resultsMap: resultsMap ?? this.resultsMap,
        isLoading: isLoading ?? this.isLoading,
      );
}
