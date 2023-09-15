part of domain.datasource;

abstract class CharactersDatarource {
  Future<Info> getInfoCharacter({int page = 1});
  Future<List<Result>> getAllCharacter({int page = 1});
  Future<List<Result>> getCharacterByFilter({String filter, String query});
  Future<List<Result>> getCharacterBySearch(String filter);
  Future<Result> getCharacterById(String characterId);
}
