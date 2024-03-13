import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/incoming_request_controller.dart';

class IncomingRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncomingRequestController>(
      () => IncomingRequestController(sl()),
    );
  }
}
