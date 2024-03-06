import 'package:get/get.dart';

import '../controllers/form_action_controller.dart';

class FormActionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormActionController>(
      () => FormActionController(),
    );
  }
}
