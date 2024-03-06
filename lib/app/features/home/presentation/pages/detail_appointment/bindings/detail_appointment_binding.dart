import 'package:get/get.dart';

import '../controllers/detail_appointment_controller.dart';

class DetailAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAppointmentController>(
      () => DetailAppointmentController(),
    );
  }
}
