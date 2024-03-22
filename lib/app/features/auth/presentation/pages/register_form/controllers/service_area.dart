// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:get/get.dart';
import 'package:libela_practition/app/core/utils/app_storage/app_storage.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_service_area.dart';

import '../../../../../../core/components/snackbar/app_snackbar.dart';
import '../../../../../profile/presentation/utils/model/typedef.dart';
import '../../../../domain/usecase/get_service_area.dart';
import '../../../../domain/usecase/get_specialization.dart';
import '../../../utils/model/personal_service_area_body.dart';
import '../../../utils/model/typedef.dart';
import 'profession_controller.dart';
import 'register_form_controller.dart';

class RegisterServiceAreaController extends GetxController {
  final GetServiceArea _getServiceArea;
  final GetSpecialization _getSpecialization;
  final UpdateServiceAreaData _updateServiceAreaData;

  RegisterServiceAreaController(this._getServiceArea, this._getSpecialization,
      this._updateServiceAreaData);
  final registerController = Get.find<RegisterFormController>();
  final professionController = Get.find<RegisterProfessionController>();

  UserProfileData? userProfileData;

  String? professionId;

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
    if (selectedServiceArea.length == 3) {
      AppSnackbar.show(message: 'Maksimal 3', type: SnackType.error);
    } else {
      if (selectedServiceArea.contains(value)) {
        selectedServiceArea.remove(value);
      } else {
        selectedServiceArea.add(value);
      }
      update();
    }
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

  void next() {
    registerController.next();
  }

  void previous() {
    registerController.previous();
  }

  void getProfessionId() async {
    professionId = await AppStorage().getProfessionId();
    log('Profession : $professionId');
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
      print(error.message);
    }, (data) {
      registerController.next();
    });
    uploadServiceAreaDataLoading = false;
    update();
  }

  void setServiceAreaData() {
    if (Get.arguments != null) {
      if (Get.arguments[1] != null) {
        userProfileData = Get.arguments[1];
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
  }

  bool get isServiceAreaNotNull {
    return nullCheck(userProfileData?.practitionerServiceArea?.length);
  }

  bool nullCheck(dynamic value) {
    return value != null &&
        value != '' &&
        value != 0 &&
        !(value is List && value.isEmpty);
  }

  @override
  void onInit() {
    getServiceArea().whenComplete(() {
      setServiceAreaData();
    });
    log("Init Terpanggil");
    getProfessionId();
    // getSpecialization(professionController.selectedProffesion?.id ?? '');
    super.onInit();
  }

  @override
  void onReady() {
    log("Ready Terpanggil");
    super.onReady();
  }
}
