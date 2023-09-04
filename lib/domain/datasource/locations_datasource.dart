part of domain.datasource;

abstract class LocationsDatarource {
  Future<List<Result>> getAllLocations({int page = 1});
  Future<Info> getInfoLocation({int page = 1});
  Future<Result> getLocationById(String locationId);
  Future<List<Result>> getLocationByFilter({String filter, String query});
  Future<List<Result>> getLocationBySearch(String filter);
}
