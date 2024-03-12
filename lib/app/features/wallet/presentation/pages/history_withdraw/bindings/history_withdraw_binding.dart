import 'package:get/get.dart';

import '../controllers/history_withdraw_controller.dart';

class HistoryWithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryWithdrawController>(
      () => HistoryWithdrawController(),
    );
  }
}
