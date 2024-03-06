import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(sl(), sl()),
    );
  }
}
