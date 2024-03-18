// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/snackbar/app_snackbar.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_profession_data.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/controllers/profile_page_controller.dart';

import '../../../../../../core/utils/app_storage/app_storage.dart';
import '../../../../../auth/domain/usecase/get_profession.dart';
import '../../../../../auth/domain/usecase/get_specialization.dart';
import '../../../../../auth/presentation/utils/model/profession_body.dart';
import '../../../../../auth/presentation/utils/model/typedef.dart';
import '../../../../domain/entities/user_profile.dart';

class EditProfessionController extends GetxController {
  final GetProfession _getProfession;
  final GetSpecialization _getSpecialization;
  final UpdateProfessionData _updateProfessionData;

  EditProfessionController(
      this._getProfession, this._getSpecialization, this._updateProfessionData);

  UserProfileEntity? userProfileData;

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
    print(value.id);
    update();
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

  Future<void> updateProfession() async {
    uploadProfessionDataLoading = true;
    update();
    var body = ProfessionBody(
        professionId: selectedProffesion?.id ?? '',
        education: selectedEducation ?? '');
    print(body.toJson());
    final response = await _updateProfessionData(body);
    response.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      AppStorage().saveProfessionId(data.id ?? '');
      AppSnackbar.show(
          message: 'Berhasil update profesi', type: SnackType.success);
      Get.find<ProfilePageController>().getUserProfile();
    });

    uploadProfessionDataLoading = false;
    update();
  }

  void setProfessionData() {
    if (Get.arguments != null) {
      userProfileData = Get.arguments;
      if (isProfessionNotNull) {
        selectedEducation = userProfileData?.education ?? "";
        selectedProffesion = proffesion
            .firstWhere((e) => e.id == userProfileData?.professions?.id);
        update();
        getSpecialization(selectedProffesion?.id ?? '');
      }
    }
  }

  bool get isProfessionNotNull {
    return nullCheck(userProfileData?.education) &&
        nullCheck(userProfileData?.professions?.id);
  }

  bool nullCheck(dynamic value) {
    return value != null && value != '' && !(value is List && value.isEmpty);
  }

  @override
  void onInit() {
    getProfession();
    super.onInit();
  }
}
