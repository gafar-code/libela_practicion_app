import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/faq_controller.dart';

class FaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(
      () => FaqController(sl()),
    );
  }
}
