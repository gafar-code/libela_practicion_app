import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/schedule_page_controller.dart';

class SchedulePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulePageController>(
      () => SchedulePageController(sl(), sl()),
    );
  }
}
