import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/history_withdraw_controller.dart';

class HistoryWithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryWithdrawController>(
      () => HistoryWithdrawController(sl()),
    );
  }
}
