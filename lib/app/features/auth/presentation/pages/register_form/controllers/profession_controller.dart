// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_profession_data.dart';

import '../../../../../../core/utils/app_storage/app_storage.dart';
import '../../../../../../core/utils/snackbar_helper.dart';
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
    // getSpecialization(selectedProffesion?.id ?? '');
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
    print(body.toJson());
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

  @override
  void onInit() {
    getProfession();
    super.onInit();
  }
}
