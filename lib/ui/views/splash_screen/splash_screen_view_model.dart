import 'package:rfid_app/app/core/custom_base_view_model.dart';

import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('SplashScreenViewModel');
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    // navigate to login page
    // ignore: use_build_context_synchronously
    socketIoClient.init();
    socketIoClient.on('coba', (data) {
      log.i('data : $data');
    });
    navigationService.replaceWith(Routes.loginScreenView);
  }
}
