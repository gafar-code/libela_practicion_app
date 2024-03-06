import 'package:get/get.dart';

import '../controllers/forgot_success_controller.dart';

class ForgotSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotSuccessController>(
      () => ForgotSuccessController(),
    );
  }
}
