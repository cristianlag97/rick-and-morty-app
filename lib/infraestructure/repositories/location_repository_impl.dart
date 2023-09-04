part of imfraestructure.repository;

class LocationsRepositoryImpl extends LocationRepository {
  final LocationsDatarource locationsDatarource;

  LocationsRepositoryImpl(this.locationsDatarource);

  @override
  Future<List<Result>> getAllLocation({int page = 1}) {
    return locationsDatarource.getAllLocations(page: page);
  }

  @override
  Future<Info> getInfoLocation({int page = 1}) {
    return locationsDatarource.getInfoLocation(page: page);
  }

  @override
  Future<List<Result>> getLocationByFilter({
    String filter = '',
    String query = '',
  }) {
    return locationsDatarource.getLocationByFilter(
        filter: filter, query: query);
  }

  @override
  Future<Result> getLocationById(String locationId) {
    return locationsDatarource.getLocationById(locationId);
  }

  @override
  Future<List<Result>> getLocationBySearch(String filter) {
    return locationsDatarource.getLocationBySearch(filter);
  }
}
