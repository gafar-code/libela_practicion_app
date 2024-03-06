import 'dart:developer';

import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/dialog/confirmation_dialog.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/snackbar_helper.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/get_user_profile.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

import '../../../utils/model/typedef.dart';

class ProfilePageController extends GetxController {
  final GetUserProfile _getUserProfile;
  ProfilePageController(this._getUserProfile);

  List<dynamic> listMenu = [
    {'title': 'Personal Data', 'icon': personalDataLine},
    {'title': 'Rekening Bank', 'icon': bankLine},
    {'title': 'Ubah No. Handphone', 'icon': phoneLine},
    {'title': 'Ubah Email', 'icon': emailLine},
    {'title': 'Chat Support', 'icon': chatLine},
    {'title': 'FAQ', 'icon': questionLine},
    {'title': 'Logout', 'icon': logoutLine},
  ];

  UserProfileData? userProfileData;
  int? currentStepRegister;

  Future<void> getUserProfile() async {
    log("GET PROFILE");
    final result = await _getUserProfile();
    result.fold((error) {
      SnackBarHelper.showSnackBarError(Get.context!, error.message);
    }, (data) {
      userProfileData = data;
      currentStepRegister = convertStepRegister(data.registrationCompletion);
      update();
    });
  }

  int? convertStepRegister(StepRegistation? reg) {
    int index = 0;
    if (reg?.step1 != true) return index;
    index++;
    if (reg?.step2 != true) return index;
    index++;
    if (reg?.step3 != true) return index;
    index++;
    if (reg?.step4 != true) return index;
    index++;
    if (reg?.step5 != true) return index;
    return null;
  }

  void actionMenu(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.PERSONAL_DATA, arguments: userProfileData);
        break;
      case 1:
        Get.toNamed(Routes.BANK_REKENING);
        break;
      case 2:
        Get.toNamed(Routes.EDIT_NUMBER_PHONE);
        break;
      case 3:
        Get.toNamed(Routes.EDIT_EMAIL);
        break;
      case 4:
        Get.toNamed(Routes.CHAT_SUPPORT);
        break;
      case 5:
        Get.toNamed(Routes.FAQ);
        break;
      case 6:
        confirmationLogout();
        break;
    }
  }

  void confirmationLogout() {
    ConfirmationDialog.show(
      title: 'Logout',
      message: 'Yakin ingin logout dari akun Libela Kamu?',
      onTapText: 'logout',
      onPressed: () => Get.offAllNamed(Routes.LOGIN),
    );
  }

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }
}
