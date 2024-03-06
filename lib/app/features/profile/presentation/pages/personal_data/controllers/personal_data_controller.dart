import 'package:get/get.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/personal_data/controllers/edit_biodata_controller.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/personal_data/controllers/edit_profession_controller.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/personal_data/controllers/edit_service_area.dart';

import '../../../../../../core/utils/assets/assets.dart';
import '../../../utils/model/typedef.dart';

class PersonalDataController extends GetxController {
  final editBiodataController = Get.find<EditBiodataController>();
  final editProfessionController = Get.find<EditProfessionController>();
  final editServiceAreaController = Get.find<EditServiceAreaController>();

  UserProfileData? userProfileData;
  int currentPage = 0;
  List<dynamic> listMenu = [
    {'title': 'Personal Data', 'icon': personalDataLine},
    {'title': 'Profesi', 'icon': doctorLine},
    {'title': 'Area Layanan', 'icon': maps}
  ];

  void actionMenu(int index) {
    currentPage = index;
    update();
    setDataArgument(index);
  }

  setDataArgument(int index) {
    if (index == 1) {
      editBiodataController.setDataBiodata(userProfileData);
    } else if (index == 2) {
      // editProfessionController.setDataProfession(userProfileData);
    }
  }

  @override
  void onInit() {
    userProfileData = Get.arguments;
    super.onInit();
  }
}
