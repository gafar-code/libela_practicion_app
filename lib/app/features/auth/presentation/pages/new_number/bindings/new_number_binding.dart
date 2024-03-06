import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/new_number_controller.dart';

class NewNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewNumberController>(
      () => NewNumberController(sl(), sl()),
    );
  }
}
