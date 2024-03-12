import 'package:get/get.dart';

import '../controllers/waiting_withdraw_controller.dart';

class WaitingWithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingWithdrawController>(
      () => WaitingWithdrawController(),
    );
  }
}
