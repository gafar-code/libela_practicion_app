import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/register_otp_controller.dart';

class RegisterOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterOtpController>(
      () => RegisterOtpController(sl(), sl()),
    );
  }
}
