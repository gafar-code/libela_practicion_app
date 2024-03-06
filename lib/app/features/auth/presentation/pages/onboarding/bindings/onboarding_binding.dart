import 'package:get/get.dart';
import '../../../../../../config/di/injection_container.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(sl()),
    );
  }
}
