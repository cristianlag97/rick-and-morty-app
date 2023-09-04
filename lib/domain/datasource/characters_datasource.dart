part of domain.datasource;

abstract class CharactersDatarource {
  Future<List<Result>> getAllCharacter({int page = 1});
  Future<Info> getInfoCharacter({int page = 1});
  Future<Result> getCharacterById(String characterId);
  Future<List<Result>> getCharacterByFilter({String filter, String query});
  Future<List<Result>> getCharacterBySearch(String filter);
}
