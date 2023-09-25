part of presentation.providers.location;

final locationRepositoryProvider = Provider((ref) {
  return LocationsRepositoryImpl(LocationDatasourceImpl());
});

final locationsProvider =
    StateNotifierProvider<LocationssNotifier, LocationState>((ref) {
  return LocationssNotifier(
    locationRepository: ref.watch(locationRepositoryProvider),
  );
});
