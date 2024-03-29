import 'package:get/get.dart';

import '../controllers/add_rekening_withdraw_controller.dart';

class AddRekeningWithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRekeningWithdrawController>(
      () => AddRekeningWithdrawController(),
    );
  }
}
