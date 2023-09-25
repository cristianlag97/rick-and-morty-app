part of imfraestructure.repository;

class CharactersRepositoryImpl extends CharactersRepository {
  final CharactersDatarource charactersDatarource;

  CharactersRepositoryImpl(this.charactersDatarource);

  @override
  Future<List<Result>> getAllCharacter({int page = 1}) {
    return charactersDatarource.getAllCharacter(page: page);
  }

  @override
  Future<Info> getInfoCharacter({int page = 1}) {
    return charactersDatarource.getInfoCharacter(page: page);
  }

  @override
  Future<List<Result>> getCharacterByFilter({
    String filter = '',
    String query = '',
  }) {
    return charactersDatarource.getCharacterByFilter(
      filter: filter,
      query: query,
    );
  }

  @override
  Future<Result> getCharacterById(String characterId) {
    return charactersDatarource.getCharacterById(characterId);
  }

  @override
  Future<List<Result>> getCharacterBySearch(String filter) {
    return charactersDatarource.getCharacterBySearch(filter);
  }
}
