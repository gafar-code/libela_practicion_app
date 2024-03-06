import 'package:get/get.dart';

import '../controllers/detail_personal_data_controller.dart';

class DetailPersonalDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPersonalDataController>(
      () => DetailPersonalDataController(),
    );
  }
}
