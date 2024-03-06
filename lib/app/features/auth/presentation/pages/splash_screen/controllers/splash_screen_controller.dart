// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  Future<void> startSplash() async {
    await Future.delayed(3.seconds, () {
      Get.offAllNamed(Routes.MAIN_PAGES);
    });
  }
}
