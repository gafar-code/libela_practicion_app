import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/dialog/confirmation_dialog.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/snackbar_helper.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/get_user_profile.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/update_profile.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/profile_body.dart';
import 'package:libela_practition/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/components/snackbar/app_snackbar.dart';
import '../../../../domain/usecase/upload_image.dart';
import '../../../utils/model/image_body.dart';
import '../../../utils/model/typedef.dart';

class ProfilePageController extends GetxController {
  final GetUserProfile _getUserProfile;
  final UploadImage _uploadImage;
  final UpdateProfile _updateProfile;
  ProfilePageController(
      this._getUserProfile, this._uploadImage, this._updateProfile);

  TextEditingController aboutmeController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  RefreshController refreshController = RefreshController();

  bool isEditAboutme = false;
  bool isLoadingUpdateAboutme = false;

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
    final result = await _getUserProfile();
    result.fold((error) {
      SnackBarHelper.showSnackBarError(Get.context!, error.message);
    }, (data) {
      userProfileData = data;
      currentStepRegister = convertStepRegister(data.registrationCompletion);
      update();
    });
  }

  Future<void> uploadImage({String? path, String? fileName}) async {
    var body = ImageUploadBody(fileName, '', path);
    final result = await _uploadImage(body);
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      updateProfile(data);
    });
  }

  Future<void> updateProfile(String? imageUrl) async {
    var body = ProfileBody(
      firstName: userProfileData?.firstName ?? "",
      lastName: userProfileData?.firstName ?? "",
      avatar: imageUrl,
      aboutme: aboutmeController.text,
    );

    final result = await _updateProfile(body);
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      isEditAboutme = false;
      isLoadingUpdateAboutme = false;
      update();
      getUserProfile();
      AppSnackbar.show(message: 'Berhasil update profile');
    });
  }

  void editAboutme() {
    isEditAboutme = !isEditAboutme;
    if (isEditAboutme == true) {
      aboutmeController.text = userProfileData?.aboutme ?? "";
    } else {}
    update();
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
        print(userProfileData.toString());
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
        toChatSupport();
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

  void submitAboutme() {
    if (aboutmeController.text.isNotEmpty && !focusNode.hasFocus) {
      isLoadingUpdateAboutme = true;
      update();
    }
    if (!focusNode.hasFocus) {
      updateProfile(null);
    }
  }

  void toChatSupport() async {
    final Uri _url = Uri.parse(
        'https://api.whatsapp.com/send/?phone=6285141760125&text=Halo+Libela+&type=phone_number&app_absent=0');
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  void onRefresh() async {
    await Future.delayed(1.seconds, () {
      getUserProfile();
    });
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(1.seconds);
    if (isClosed) refreshController.loadComplete();
  }

  @override
  void onInit() {
    getUserProfile();
    focusNode.addListener(() {
      submitAboutme();
    });
    super.onInit();
  }
}
