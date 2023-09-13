part of presentation.providers.search;

final searchCharacterResultProvider =
    StateNotifierProvider<SearchResultnotifier, List<Result>>((ref) {
  final resultRepository =
      ref.read(characterRepositoryProvider).getCharacterBySearch;
  return SearchResultnotifier(
    searchResults: resultRepository,
    ref: ref,
  );
});

final searchLocationResultProvider =
    StateNotifierProvider<SearchResultnotifier, List<Result>>((ref) {
  final resultRepository =
      ref.read(locationRepositoryProvider).getLocationBySearch;
  return SearchResultnotifier(
    searchResults: resultRepository,
    ref: ref,
  );
});
