import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/edit_email_controller.dart';

class EditEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEmailController>(
      () => EditEmailController(sl()),
    );
  }
}
