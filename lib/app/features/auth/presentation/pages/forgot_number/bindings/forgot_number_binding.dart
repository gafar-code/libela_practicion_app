import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/forgot_number_controller.dart';

class ForgotNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotNumberController>(
      () => ForgotNumberController(sl()),
    );
  }
}
