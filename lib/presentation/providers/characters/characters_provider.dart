part of presentation.providers.characters;

final characterRepositoryProvider = Provider((ref) {
  return CharactersRepositoryImpl(CharactersDatasourceImpl());
});

final StateNotifierProvider<CharactersNotifier, CharacterState>
    charactersProvider =
    StateNotifierProvider<CharactersNotifier, CharacterState>((ref) {
  final fetchMoreCharacters =
      ref.watch(characterRepositoryProvider).getAllCharacter;
  final fetchInfoCharacters =
      ref.watch(characterRepositoryProvider).getInfoCharacter;
  final fetchCharacterById =
      ref.watch(characterRepositoryProvider).getCharacterById;
  final fetchCharacterFilter =
      ref.watch(characterRepositoryProvider).getCharacterByFilter;
  final fetchCharactersSearch =
      ref.watch(characterRepositoryProvider).getCharacterBySearch;
  return CharactersNotifier(
    getCharacters: fetchMoreCharacters,
    getInfoCharacgers: fetchInfoCharacters,
    getCharacterById: fetchCharacterById,
    getCharacterFilter: fetchCharacterFilter,
    getCharactersSearch: fetchCharactersSearch,
  );
});
