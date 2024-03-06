import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/forgot_otp_controller.dart';

class ForgotOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotOtpController>(
      () => ForgotOtpController(sl(), sl()),
    );
  }
}
