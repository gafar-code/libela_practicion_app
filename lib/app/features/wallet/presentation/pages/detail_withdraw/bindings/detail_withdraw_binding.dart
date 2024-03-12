import 'package:get/get.dart';

import '../controllers/detail_withdraw_controller.dart';

class DetailWithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailWithdrawController>(
      () => DetailWithdrawController(),
    );
  }
}
