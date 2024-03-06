import 'package:get/get.dart';

import '../controllers/edit_email_controller.dart';

class EditEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEmailController>(
      () => EditEmailController(),
    );
  }
}
