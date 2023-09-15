part of infraestructure.services;

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  Stream<ConnectivityResult> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  Future<bool> isMobileDataConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.mobile;
  }

  Future<bool> isWifiConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi;
  }
}
