part of presentation.providers.connectivity;

enum ConnectibityApp {
  unConnect,
  connect,
  checking,
}

class ConnectivityState {
  final ConnectibityApp hasNetwork;
  final int currentPage;

  ConnectivityState({required this.hasNetwork, required this.currentPage});

  ConnectivityState copyWith({ConnectibityApp? hasNetwork, int? currentPage}) =>
      ConnectivityState(
        hasNetwork: hasNetwork ?? this.hasNetwork,
        currentPage: currentPage ?? this.currentPage,
      );
}
