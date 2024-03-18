import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/edit_number_phone_controller.dart';

class EditNumberPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditNumberPhoneController>(
      () => EditNumberPhoneController(sl(), sl()),
    );
  }
}
