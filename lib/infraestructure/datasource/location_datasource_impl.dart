part of infraestructure.datasource;

class LocationDatasourceImpl extends LocationsDatarource {
  @override
  Future<List<Result>> getAllLocations({int page = 1}) async {
    final data = await GlobalDatasourceImpl().consumer<List<Result>>(
      page: page,
      queryType: 'all',
      url: '/location/',
    );
    return data;
  }

  @override
  Future<Info> getInfoLocation({int page = 1}) async {
    final data = await GlobalDatasourceImpl().consumer<Info>(
      page: page,
      url: '/location/',
    );
    return data;
  }

  @override
  Future<List<Result>> getLocationByFilter({
    String filter = '',
    String query = '',
  }) async {
    final data = await GlobalDatasourceImpl().consumer<List<Result>>(
      filter: filter,
      query: query,
      queryType: 'filter',
      url: '/location/',
    );
    return data;
  }

  @override
  Future<Result> getLocationById(String locationId) async {
    final data = await GlobalDatasourceImpl().consumer<Result>(
      id: locationId,
      url: '/location/',
    );
    return data;
  }

  @override
  Future<List<Result>> getLocationBySearch(String filter) async {
    final data = await GlobalDatasourceImpl().consumer<List<Result>>(
      filter: 'name',
      query: filter,
      queryType: 'search',
      url: '/location/',
    );
    return data;
  }
}
