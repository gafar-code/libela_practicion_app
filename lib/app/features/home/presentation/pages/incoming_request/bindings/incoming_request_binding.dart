import 'package:get/get.dart';

import '../controllers/incoming_request_controller.dart';

class IncomingRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncomingRequestController>(
      () => IncomingRequestController(),
    );
  }
}
