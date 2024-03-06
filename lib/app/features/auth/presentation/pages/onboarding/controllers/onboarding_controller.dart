import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/utils/app_storage/app_storage.dart';
import 'package:libela_practition/app/features/auth/domain/entities/onboarding.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/get_content_onboarding.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  final GetContentOnboarding _getContentOnboarding;
  OnboardingController(this._getContentOnboarding);

  List<OnboardingEntity> contentOnboarding = [];

  late PageController pageController;
  int currentIndex = 0;
  final storage = AppStorage();

  void changePage(int index) {
    currentIndex = index;
    update();
  }

  void next() async {
    if (currentIndex == 0) {
      pageController.nextPage(
          duration: 400.milliseconds, curve: Curves.bounceIn);
      update();
    } else {
      await AppStorage().onboardingSkip();
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void previous() {
    pageController.previousPage(
        duration: 400.milliseconds, curve: Curves.bounceIn);
    update();
  }

  Future<void> getContent() async {
    contentOnboarding = await _getContentOnboarding();
    update();
  }

  @override
  void onInit() {
    getContent();
    super.onInit();
    pageController = PageController(initialPage: 0);
  }
}
