import 'package:get/get.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/controllers/profile_page_controller.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/main_pages_controller.dart';

class MainPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPagesController>(
      () => MainPagesController(),
    );
    Get.put(ProfilePageController(sl()));
  }
}
