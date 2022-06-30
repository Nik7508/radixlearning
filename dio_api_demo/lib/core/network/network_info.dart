import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl extends NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl({required this.connectivity});

  @override
  Future<bool> isConnected() async {
    if ((connectivity.checkConnectivity() == ConnectivityResult.mobile) ||
        (connectivity.checkConnectivity() == ConnectivityResult.wifi)) {
      return false;
    } else {
      return true;
    }
  }
}
