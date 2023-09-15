part of domain.datasource;

abstract class LocationsDatarource {
  Future<Info> getInfoLocation({int page = 1});
  Future<List<Result>> getAllLocations({int page = 1});
  Future<List<Result>> getLocationByFilter({String filter, String query});
  Future<List<Result>> getLocationBySearch(String filter);
  Future<Result> getLocationById(String locationId);
}
