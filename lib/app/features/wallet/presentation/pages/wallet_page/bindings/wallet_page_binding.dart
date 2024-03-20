import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/wallet_page_controller.dart';

class WalletPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletPageController>(
      () => WalletPageController(sl(), sl()),
    );
  }
}
