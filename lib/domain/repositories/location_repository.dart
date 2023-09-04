part of config.repositories;

abstract class LocationRepository {
  Future<List<Result>> getAllLocation({int page = 1});
  Future<Info> getInfoLocation({int page = 1});
  Future<Result> getLocationById(String locationId);
  Future<List<Result>> getLocationByFilter({String filter, String query});
  Future<List<Result>> getLocationBySearch(String filter);
}
