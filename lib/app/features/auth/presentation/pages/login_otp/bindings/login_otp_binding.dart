import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/login_otp_controller.dart';

class LoginOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginOtpController>(
      () => LoginOtpController(sl(), sl()),
    );
  }
}
