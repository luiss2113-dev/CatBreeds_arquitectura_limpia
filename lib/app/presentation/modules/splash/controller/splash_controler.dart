import '../../../../domain/repositories/connectivity_repository.dart';
import '../../../global/state_notify.dart';
import 'splash_state.dart';

class SplashController extends StateNotify<SplashState> {
  final ConnectivityRepository connectivityRepository;

  SplashController(super.state, {required this.connectivityRepository});

  Future<bool> initSplash() async {
    final isInternet = await connectivityRepository.isConnected;
    await Future.delayed(const Duration(seconds: 4));
    return isInternet;
  }
}
