import 'package:get/get.dart';

import '../controllers/visit_is_over_controller.dart';

class VisitIsOverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitIsOverController>(
      () => VisitIsOverController(),
    );
  }
}
