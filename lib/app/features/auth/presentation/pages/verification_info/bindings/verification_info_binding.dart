import 'package:get/get.dart';

import '../controllers/verification_info_controller.dart';

class VerificationInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationInfoController>(
      () => VerificationInfoController(),
    );
  }
}
