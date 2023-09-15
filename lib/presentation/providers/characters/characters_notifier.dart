part of presentation.providers.characters;

typedef GetCharacterByIdCallback = Future<Result> Function(String characterID);
typedef GetCharactersCallback = Future<List<Result>> Function({int page});
typedef GetIfoCharacterCallback = Future<Info> Function({int page});
typedef GetCharacterSearchCallback = Future<List<Result>> Function(
    String filter);
typedef GetCharactersFilterCallback = Future<List<Result>> Function({
  String filter,
  String query,
});

class CharactersNotifier extends StateNotifier<CharacterState> {
  CharactersNotifier({
    required this.getCharacterById,
    required this.getCharacterFilter,
    required this.getCharacters,
    required this.getCharactersSearch,
    required this.getInfoCharacgers,
  }) : super(
          const CharacterState(
            lastPage: 1000,
            results: [],
          ),
        );

  bool isLoading = false;
  GetCharacterByIdCallback getCharacterById;
  GetCharactersCallback getCharacters;
  GetCharacterSearchCallback getCharactersSearch;
  GetCharactersFilterCallback getCharacterFilter;
  GetIfoCharacterCallback getInfoCharacgers;
  int currentPage = 0;

  Future<void> handleAddInfo() async {
    if ((currentPage != state.lastPage) && !state.isFilter) {
      final info = await getInfoCharacgers(page: currentPage);
      state = state.copyWith(lastPage: info.pages);
    }
  }

  Future<void> loadCharacters() async {
    if (isLoading) return;
    isLoading = true;
    if ((currentPage != state.lastPage) && !state.isFilter) {
      state.results.isEmpty && currentPage > 0
          ? currentPage = 1
          : currentPage++;
      final List<Result> characters = await getCharacters(page: currentPage);
      state = state.copyWith(results: [...state.results, ...characters]);
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
    }
  }

  Future<void> loadCharacterId(String characterId) async {
    if (isLoading) return;
    isLoading = true;
    final Result character = await getCharacterById(characterId);
    state = state.copyWith(
      result: character,
      resultsMap: {
        ...state.resultsMap,
        characterId: character,
      },
    );
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

  Future<void> loadCharactersFilter({
    String filter = '',
    String query = '',
  }) async {
    state = state.copyWith(isLoading: true);
    if (isLoading) return;
    isLoading = true;
    final List<Result> character = await getCharacterFilter(
      filter: filter,
      query: query,
    );
    state = state.copyWith(
      results: character,
      isFilter: true,
    );
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    state = state.copyWith(isLoading: false);
  }

  Future<void> handleDeleteFilter() async {
    state = state.copyWith(isLoading: true);
    if (isLoading) return;
    isLoading = true;
    if (state.isFilter) {
      final List<Result> characters = await getCharacters(page: currentPage);
      state = state.copyWith(
        isFilter: false,
        results: [...characters],
      );
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadSearchResult(String filter) async {
    if (isLoading) return;
    isLoading = true;
    final List<Result> characters = await getCharactersSearch(filter);
    state = state.copyWith(results: characters);
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
