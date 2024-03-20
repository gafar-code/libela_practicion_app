import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/withdraw_controller.dart';

class WithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WithdrawController>(
      () => WithdrawController(sl(), sl()),
    );
  }
}
