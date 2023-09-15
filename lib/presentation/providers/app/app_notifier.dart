part of presentation.providers.connectivity;

class ConnectivityNotifier extends StateNotifier<ConnectivityState> {
  ConnectivityNotifier()
      : super(ConnectivityState(
          hasNetwork: ConnectibityApp.checking,
          currentPage: 0,
        )) {
    _handleInternetListening();
  }

  Future<void> _handleInternetListening() async {
    final ConnectivityService connectivityService = ConnectivityService();
    connectivityService.connectivityStream.listen((result) {
      state = state.copyWith(
        hasNetwork: result != ConnectivityResult.none
            ? ConnectibityApp.connect
            : ConnectibityApp.unConnect,
        currentPage: 0,
      );
    });
  }

  Future<void> handleCurrentPage(int currentPage) async {
    state = state.copyWith(currentPage: currentPage);
  }
}
