part of presentation.providers.location;

final locationRepositoryProvider = Provider((ref) {
  return LocationsRepositoryImpl(LocationDatasourceImpl());
});

final StateNotifierProvider<LocationssNotifier, LocationState>
    locationsProvider =
    StateNotifierProvider<LocationssNotifier, LocationState>((ref) {
  final fetchMoreCharacters =
      ref.watch(locationRepositoryProvider).getAllLocation;
  final fetchInfoLocation =
      ref.watch(locationRepositoryProvider).getInfoLocation;
  final fetchLocationById =
      ref.watch(locationRepositoryProvider).getLocationById;
  final fetchLocationsFilter =
      ref.watch(locationRepositoryProvider).getLocationByFilter;
  final fetchLocationSearch =
      ref.watch(locationRepositoryProvider).getLocationBySearch;
  return LocationssNotifier(
    getInfoLocation: fetchInfoLocation,
    getLocationById: fetchLocationById,
    getLocations: fetchMoreCharacters,
    getLocationSearch: fetchLocationSearch,
    getLocationsFilter: fetchLocationsFilter,
  );
});
