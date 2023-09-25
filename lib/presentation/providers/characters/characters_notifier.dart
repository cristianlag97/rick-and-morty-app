part of presentation.providers.characters;

class CharactersNotifier extends StateNotifier<CharacterState> {
  CharactersNotifier({
    required this.charactersRepository,
  }) : super(
          const CharacterState(
            lastPage: 1000,
            results: [],
          ),
        );

  bool isLoading = false;
  CharactersRepository charactersRepository;
  int currentPage = 0;

  Future<void> handleAddInfo() async {
    if ((currentPage != state.lastPage) && !state.isFilter) {
      final info =
          await charactersRepository.getInfoCharacter(page: currentPage);
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
      final List<Result> characters =
          await charactersRepository.getAllCharacter(page: currentPage);
      state = state.copyWith(results: [...state.results, ...characters]);
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
    }
  }

  Future<void> loadCharacterId(String characterId) async {
    if (isLoading) return;
    isLoading = true;
    final Result character =
        await charactersRepository.getCharacterById(characterId);
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
    final List<Result> character =
        await charactersRepository.getCharacterByFilter(
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
      final List<Result> characters =
          await charactersRepository.getAllCharacter(page: currentPage);
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
    final List<Result> characters =
        await charactersRepository.getCharacterBySearch(filter);
    state = state.copyWith(results: characters);
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
