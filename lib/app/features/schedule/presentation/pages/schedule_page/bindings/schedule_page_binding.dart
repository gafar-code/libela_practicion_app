import 'package:get/get.dart';

import '../controllers/schedule_page_controller.dart';

class SchedulePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SchedulePageController(),
    );
  }
}
