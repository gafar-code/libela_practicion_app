import 'package:get/get.dart';

import '../controllers/bank_rekening_controller.dart';

class BankRekeningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankRekeningController>(
      () => BankRekeningController(),
    );
  }
}
