// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_profession_data.dart';

import '../../../../../../core/utils/app_storage/app_storage.dart';
import '../../../../../../core/utils/snackbar_helper.dart';
import '../../../../../profile/presentation/utils/model/typedef.dart';
import '../../../../domain/usecase/get_profession.dart';
import '../../../../domain/usecase/get_specialization.dart';
import '../../../utils/model/profession_body.dart';
import '../../../utils/model/typedef.dart';
import 'register_form_controller.dart';

class RegisterProfessionController extends GetxController {
  final GetProfession _getProfession;
  final GetSpecialization _getSpecialization;
  final UpdateProfessionData _updateProfessionData;

  RegisterProfessionController(
      this._getProfession, this._getSpecialization, this._updateProfessionData);
  final registerController = Get.find<RegisterFormController>();

  UserProfileData? userProfileData;

  // List Data
  ProffesionList proffesion = [];
  SpecializationList specialization = [];

  // Local Data

  List<String> educations = ['D1', 'D2', 'D3', 'S1', 'S2', 'S3'];

  // Data Loading

  ProffesionLoading proffesionLoading = false;
  SpecializationLoading specializationLoading = false;
  UploadProfessionDataLoading uploadProfessionDataLoading = false;

  // Selected Data
  Proffesion? selectedProffesion;
  Specialization? selectedSpecialization;
  String? selectedEducation;

  void selectProffesion(Proffesion value) {
    selectedProffesion = value;
    selectedSpecialization = null;
    update();
    getSpecialization(selectedProffesion?.id ?? '');
  }

  void selectSpecialization(Specialization value) {
    selectedSpecialization = value;
    update();
  }

  void selectEducation(String value) {
    selectedEducation = value;
    update();
  }

  Future<void> getProfession() async {
    proffesionLoading = true;
    update();
    final response = await _getProfession();
    response.fold((error) {
      print(error.message);
    }, (data) {
      proffesion = data;
      setProfessionData();
    });
    proffesionLoading = false;
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

  void previous() {
    registerController.previous();
  }

  Future<void> updateProfession() async {
    uploadProfessionDataLoading = true;
    update();
    var body = ProfessionBody(
        professionId: selectedProffesion?.id ?? '',
        education: selectedEducation ?? '');
    final response = await _updateProfessionData(body);
    response.fold((error) {
      SnackBarHelper.showSnackBarError(Get.context!, error.message);
    }, (data) {
      AppStorage().saveProfessionId(selectedProffesion?.id ?? '');
      registerController.next();
    });

    uploadProfessionDataLoading = false;
    update();
  }

  void setProfessionData() {
    if (Get.arguments != null) {
      if (Get.arguments[1] != null) {
        userProfileData = Get.arguments[1];
        if (isProfessionNotNull) {
          selectedEducation = userProfileData?.education ?? "";
          selectedProffesion = proffesion
              .firstWhere((e) => e.id == userProfileData?.professions?.id);
          update();
          getSpecialization(selectedProffesion?.id ?? '');
        }
      }
    }
  }

  bool get isProfessionNotNull {
    return nullCheck(userProfileData?.education) &&
        nullCheck(userProfileData?.professions?.id);
  }

  bool nullCheck(dynamic value) {
    return value != null &&
        value != '' &&
        value != 0 &&
        !(value is List && value.isEmpty);
  }

  @override
  void onInit() {
    getProfession();
    super.onInit();
  }
}
