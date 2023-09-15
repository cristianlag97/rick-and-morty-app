part of config.repositories;

abstract class LocationRepository {
  Future<Info> getInfoLocation({int page = 1});
  Future<List<Result>> getAllLocation({int page = 1});
  Future<List<Result>> getLocationByFilter({String filter, String query});
  Future<List<Result>> getLocationBySearch(String filter);
  Future<Result> getLocationById(String locationId);
}
