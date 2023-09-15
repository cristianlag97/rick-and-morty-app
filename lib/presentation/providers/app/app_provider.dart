part of presentation.providers.connectivity;

final appProviderState =
    StateNotifierProvider<ConnectivityNotifier, ConnectivityState>((ref) {
  return ConnectivityNotifier();
});
