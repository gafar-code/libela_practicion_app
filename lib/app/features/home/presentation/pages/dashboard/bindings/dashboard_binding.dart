import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(sl()),
    );
  }
}
