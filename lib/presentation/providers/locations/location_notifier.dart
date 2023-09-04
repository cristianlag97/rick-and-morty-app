part of presentation.providers.location;

typedef GetLocationsCallback = Future<List<Result>> Function({int page});
typedef GetIfoLocationCallback = Future<Info> Function({int page});
typedef GetLocationByIdCallback = Future<Result> Function(String locationId);
typedef GetLocationSearchCallback = Future<List<Result>> Function(
    String filter);
typedef GetLocationsFilterCallback = Future<List<Result>> Function({
  String filter,
  String query,
});

class LocationssNotifier extends StateNotifier<LocationState> {
  LocationssNotifier({
    required this.getLocations,
    required this.getInfoLocation,
    required this.getLocationById,
    required this.getLocationsFilter,
    required this.getLocationSearch,
  }) : super(
          const LocationState(
            lastPage: 1000,
            results: [],
          ),
        );

  GetLocationsCallback getLocations;
  GetIfoLocationCallback getInfoLocation;
  GetLocationByIdCallback getLocationById;
  GetLocationsFilterCallback getLocationsFilter;
  GetLocationSearchCallback getLocationSearch;
  int currentPage = 0;
  bool isLoading = false;

  Future<void> handleAddInfo() async {
    if ((currentPage != state.lastPage) && !state.isFilter) {
      final info = await getInfoLocation(page: currentPage);
      state = state.copyWith(lastPage: info.pages);
    }
  }

  Future<void> loadLocations() async {
    if (isLoading) return;
    isLoading = true;
    if ((currentPage != state.lastPage) && !state.isFilter) {
      state.results.isEmpty && currentPage > 0
          ? currentPage = 1
          : currentPage++;
      final List<Result> locations = await getLocations(page: currentPage);
      state = state.copyWith(results: [...state.results, ...locations]);
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
    }
  }

  Future<void> loadLocationId(String locationId) async {
    if (isLoading) return;
    isLoading = true;
    final Result location = await getLocationById(locationId);
    state = state.copyWith(
      result: location,
      resultsMap: {
        ...state.resultsMap,
        locationId: location,
      },
    );
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

  Future<void> loadLocationsFilter({
    String filter = '',
    String query = '',
  }) async {
    state = state.copyWith(isLoading: true);
    if (isLoading) return;
    isLoading = true;
    final List<Result> locations = await getLocationsFilter(
      filter: filter,
      query: query,
    );
    state = state.copyWith(results: locations, isFilter: true);
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    state = state.copyWith(isLoading: false);
  }

  Future<void> handleDeleteFilter() async {
    state = state.copyWith(isLoading: true);
    if (isLoading) return;
    isLoading = true;
    if (state.isFilter) {
      final List<Result> locations = await getLocations(page: currentPage);
      state = state.copyWith(
        isFilter: false,
        results: [...locations],
      );
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadSearchResult(String filter) async {
    try {
      if (isLoading) return;
      isLoading = true;
      final List<Result> locations = await getLocationSearch(filter);
      state = state.copyWith(results: locations);
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
    } on ResultnotFound catch (e) {
      state = state.copyWith(errorMessage: e.message);
    } catch (_) {
      state = state.copyWith(errorMessage: 'unhandled error');
    }
  }

  Future<void> searchError(String message) async {
    state = state.copyWith(errorMessage: message);
  }

  Future<void> cleanResults() async {
    state = state.copyWith(results: []);
  }
}
