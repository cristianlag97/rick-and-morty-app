part of config.router;

class GoRouterNotifier extends ChangeNotifier {
  final ConnectivityNotifier _connectivity;

  GoRouterNotifier(this._connectivity) {
    _connectivity.addListener((state) {
      connectServices = state.hasNetwork;
    });
  }

  ConnectibityApp _connectServices = ConnectibityApp.checking;

  ConnectibityApp get connectServices => _connectServices;

  set connectServices(ConnectibityApp value) {
    _connectServices = value;
    notifyListeners();
  }
}

final goRouterNotifierProvider = Provider((ref) {
  final connectionNotifier = ref.read(appProviderState.notifier);
  return GoRouterNotifier(connectionNotifier);
});
