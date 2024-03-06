// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:get/get.dart';
import 'package:libela_practition/app/core/utils/app_storage/app_storage.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_service_area.dart';

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

  String? professionId;

  // List Data

  ServiceAreaList serviceArea = [];
  SpecializationList specialization = [];

// Data Loading
  ServiceAreaLoading serviceAreaLoading = false;
  SpecializationLoading specializationLoading = false;
  UploadServiceAreaDataLoading uploadServiceAreaDataLoading = false;

  // Selected Data

  Specializations selectedSpecializationServiceArea = [];
  ServiceArea? selectedServiceArea;

  void selectSpecializationServiceArea(Specialization value) {
    if (selectedSpecializationServiceArea.contains(value)) {
      selectedSpecializationServiceArea.remove(value);
    } else {
      selectedSpecializationServiceArea.add(value);
    }
    update();
  }

  void selectServiceArea(ServiceArea value) {
    selectedServiceArea = value;
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

  void next() {
    registerController.next();
  }

  void previous() {
    registerController.previous();
  }

  void getProfessionId() async {
    professionId = await AppStorage().getProfessionId();
    getSpecialization(professionId ?? '');
  }

  Future<void> updateServiceArea() async {
    uploadServiceAreaDataLoading = true;
    update();
    var body = PersonalServiceAreaBody(
      serviceAreaIds: [selectedServiceArea?.id ?? 0],
      serviceSpecializations:
          selectedSpecializationServiceArea.map((e) => {'id': e.id}).toList(),
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

  @override
  void onInit() {
    getServiceArea();
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
