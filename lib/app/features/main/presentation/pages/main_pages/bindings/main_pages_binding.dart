import 'package:get/get.dart';
import 'package:libela_practition/app/features/home/presentation/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/controllers/profile_page_controller.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/schedule_page/controllers/schedule_page_controller.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/wallet_page/controllers/wallet_page_controller.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/main_pages_controller.dart';

class MainPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPagesController>(
      () => MainPagesController(),
    );
    Get.put(DashboardController(sl()));
    Get.put(WalletPageController(sl(), sl()));
    Get.put(SchedulePageController(sl(), sl(), sl()));
    Get.put(ProfilePageController(sl(), sl(), sl()));
  }
}
