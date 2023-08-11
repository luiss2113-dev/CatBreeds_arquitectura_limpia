
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/connectivity_repository.dart';
import '../services/remote/internet_checker.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;

  ConnectivityRepositoryImpl(this._connectivity, this._internetChecker);

  @override
  Future<bool> get isConnected async {
    final verificationInternet = await _connectivity.checkConnectivity();
    if (verificationInternet == ConnectivityResult.none) {
      return Future.value(false);
    }

    return _internetChecker.hasInternet();
  }

}
