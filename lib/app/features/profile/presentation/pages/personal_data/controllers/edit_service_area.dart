// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/snackbar/app_snackbar.dart';
import 'package:libela_practition/app/core/utils/app_storage/app_storage.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_service_area.dart';
import '../../../../../auth/domain/usecase/get_service_area.dart';
import '../../../../../auth/domain/usecase/get_specialization.dart';
import '../../../../../auth/presentation/utils/model/personal_service_area_body.dart';
import '../../../../../auth/presentation/utils/model/typedef.dart';
import '../../../../domain/entities/user_profile.dart';
import '../../profile_page/controllers/profile_page_controller.dart';
import 'edit_profession_controller.dart';

class EditServiceAreaController extends GetxController {
  final GetServiceArea _getServiceArea;
  final GetSpecialization _getSpecialization;
  final UpdateServiceAreaData _updateServiceAreaData;

  EditServiceAreaController(this._getServiceArea, this._getSpecialization,
      this._updateServiceAreaData);
  final professionController = Get.find<EditProfessionController>();

  String? professionId;
  UserProfileEntity? userProfileData;

  // List Data

  ServiceAreaList serviceArea = [];
  SpecializationList specialization = [];

// Data Loading
  ServiceAreaLoading serviceAreaLoading = false;
  SpecializationLoading specializationLoading = false;
  UploadServiceAreaDataLoading uploadServiceAreaDataLoading = false;

  // Selected Data

  List<String> selectedSpecializationServiceArea = [];
  List<ServiceArea> selectedServiceArea = [];

  void selectSpecializationServiceArea(String value) {
    if (selectedSpecializationServiceArea.contains(value)) {
      selectedSpecializationServiceArea.remove(value);
    } else {
      selectedSpecializationServiceArea.add(value);
    }
    update();
  }

  void selectServiceArea(ServiceArea value) {
    if (selectedServiceArea.contains(value)) {
      selectedServiceArea.remove(value);
    } else {
      selectedServiceArea.add(value);
    }
    update();
  }

  Future<void> getServiceArea() async {
    serviceAreaLoading = true;
    update();
    final response = await _getServiceArea();
    response.fold((error) {
      print(error.message);
    }, (data) {
      serviceArea = data;
    });
    serviceAreaLoading = false;
    update();
  }

  Future<void> getSpecialization(ProfessionId id) async {
    specializationLoading = true;
    update();
    final response = await _getSpecialization(id);
    response.fold((error) {
      print(error.message);
    }, (data) {
      specialization = data;
    });
    specializationLoading = false;
    update();
  }

  void getProfessionId() async {
    professionId = await AppStorage().getProfessionId();
    getSpecialization(professionId ?? '');
  }

  Future<void> updateServiceArea() async {
    uploadServiceAreaDataLoading = true;
    update();
    var body = PersonalServiceAreaBody(
      serviceAreaIds: List.generate(selectedServiceArea.length,
          (index) => selectedServiceArea[index].id ?? 0),
      serviceSpecializations:
          selectedSpecializationServiceArea.map((e) => {'id': e}).toList(),
    );
    final response = await _updateServiceAreaData(body);
    response.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      AppSnackbar.show(
          message: 'Berhasil update service area', type: SnackType.success);
      Get.find<ProfilePageController>().getUserProfile();
    });
    uploadServiceAreaDataLoading = false;
    update();
  }

  void setServiceAreaData() {
    if (Get.arguments != null) {
      userProfileData = Get.arguments;
      if (isServiceAreaNotNull) {
        selectedServiceArea = List.generate(
            userProfileData?.practitionerServiceArea?.length ?? 0,
            (index) => serviceArea.firstWhere((e) =>
                e.id ==
                userProfileData
                    ?.practitionerServiceArea?[index].serviceAreasId));
        List<String> data = List.generate(
            userProfileData?.practititonerServiceSkill?.length ?? 0,
            (index) =>
                userProfileData?.practititonerServiceSkill?[index].skillsId ??
                '');
        selectedSpecializationServiceArea = data;
        update();
      }
    }
  }

  bool get isServiceAreaNotNull {
    return nullCheck(userProfileData?.practitionerServiceArea?.length);
  }

  bool nullCheck(dynamic value) {
    return value != null && value != '' && !(value is List && value.isEmpty);
  }

  @override
  void onInit() {
    getServiceArea().whenComplete(() {
      setServiceAreaData();
    });
    getProfessionId();
    // getSpecialization(professionController.selectedProffesion?.id ?? '');
    super.onInit();
  }
}
