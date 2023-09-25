part of presentation.providers.characters;

final characterRepositoryProvider = Provider((ref) {
  return CharactersRepositoryImpl(CharactersDatasourceImpl());
});

final charactersProvider =
    StateNotifierProvider<CharactersNotifier, CharacterState>((ref) {
  return CharactersNotifier(
    charactersRepository: ref.watch(characterRepositoryProvider),
  );
});
