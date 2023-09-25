part of presentation.providers.characters;

final characterRepositoryProvider = Provider((ref) {
  return CharactersRepositoryImpl(CharactersDatasourceImpl());
});

final StateNotifierProvider<CharactersNotifier, CharacterState>
    charactersProvider =
    StateNotifierProvider<CharactersNotifier, CharacterState>((ref) {
  final fetchCharacters = ref.watch(characterRepositoryProvider);
  return CharactersNotifier(
    getCharacterById: fetchCharacters.getCharacterById,
    getCharacterFilter: fetchCharacters.getCharacterByFilter,
    getCharacters: fetchCharacters.getAllCharacter,
    getCharactersSearch: fetchCharacters.getCharacterBySearch,
    getInfoCharacgers: fetchCharacters.getInfoCharacter,
  );
});
