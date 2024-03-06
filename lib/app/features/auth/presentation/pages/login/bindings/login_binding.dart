import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(sl(), sl()),
    );
  }
}
