import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/utils/app_storage/app_storage.dart';

import '../../routes/app_pages.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    bool? onboarding = AppStorage().onboardingCheck() ?? false;
    if (onboarding == false) {
      return const RouteSettings(name: Routes.ONBOARDING);
    }
    return null;
  }
}
