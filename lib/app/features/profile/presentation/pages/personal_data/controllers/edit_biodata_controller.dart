import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:libela_practition/app/core/utils/snackbar_helper.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_personal_data.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/personal_data_body.dart';
import '../../../../../../core/components/components_lib.dart';
import '../../../../../auth/domain/usecase/get_cities.dart';
import '../../../../../auth/domain/usecase/get_provinces.dart';
import '../../../../../auth/presentation/utils/model/typedef.dart';
import '../../../utils/model/typedef.dart';
import '../views/widget/picker_date.dart';

class EditBiodataController extends GetxController {
  final GetProvinces _getProvinces;
  final GetCities _getCities;
  final UpdatePersonalData _updatePersonalData;
  EditBiodataController(
      this._getProvinces, this._getCities, this._updatePersonalData);

  TextEditingController firstnamaController = TextEditingController();
  TextEditingController lastnamaController = TextEditingController();
  TextEditingController ktpController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // List Data
  ProvinciesList provincies = [];
  CitiesList cities = [];

  // Data Loading
  ProvinciesLoading provincesLoading = false;
  CitiesLoading citiesLoading = false;
  UploadPersonalDataLoading uploadPersonalDataLoading = false;
  UploadEmailDataLoading uploadEmailDataLoading = false;

  // Selected Data
  var selectedDatePicker = "";
  var selectedBirtDay = "";
  var datePicker = <DateTime?>[];
  Provinces? selectedProvincies;
  Cities? selectedCities;

  // Validate
  var firstnamaValidated = false.obs;
  var lastnamaValidated = false.obs;
  var ktpValidated = false.obs;
  var addressValidated = false.obs;
  var isEmailValidated = false.obs;

  List<String> genders = ['Laki-laki', 'Perempuan'];
  int selectedGender = 0;
  String nameGender = "L";

  void selectGender(int index) {
    selectedGender = index;
    if (index == 0) {
      nameGender = "L";
    } else {
      nameGender = "P";
    }
    update();
  }

  void selectProvincies(Provinces value) {
    selectedProvincies = value;
    selectedCities = null;
    update();
    getCities(selectedProvincies?.id ?? 0);
  }

  void selectCities(Cities value) {
    selectedCities = value;
    update();
  }

  listenFirstNameForm(String value) {
    if (value.isNotEmpty) {
      firstnamaValidated(true);
    } else {
      firstnamaValidated(false);
    }
  }

  listenLastNameForm(String value) {
    if (value.isNotEmpty) {
      lastnamaValidated(true);
    } else {
      lastnamaValidated(false);
    }
  }

  listenKtpForm(String value) {
    if (value.isNotEmpty) {
      if (value.length == 16) {
        ktpValidated(true);
      } else {
        ktpValidated(false);
      }
    } else {
      ktpValidated(false);
    }
  }

  listenAddressForm(String value) {
    if (value.isNotEmpty) {
      addressValidated(true);
    } else {
      addressValidated(false);
    }
  }

  Future<void> getProvinces() async {
    provincesLoading = true;
    update();
    final response = await _getProvinces();
    response.fold((error) {
      SnackBarHelper.showSnackBarError(Get.context!, error.message);
    }, (data) {
      provincies = data;
    });
    provincesLoading = false;
    update();
  }

  Future<void> getCities(int id) async {
    citiesLoading = true;
    update();
    final response = await _getCities(id);
    response.fold((error) {
      SnackBarHelper.showSnackBarError(Get.context!, error.message);
    }, (data) {
      cities = data;
    });
    citiesLoading = false;
    update();
  }

  void openCalendarView() {
    CustomBottomSheet.show(child: PickerDate(controller: this));
  }

  pickDate(List<DateTime?> date) {
    selectedDatePicker = DateFormat('dd-MM-yyyy').format(date[0]!);
    datePicker = date;
    DateTime parsedDate = DateTime.parse("${datePicker.first}");
    // ignore: unused_local_variable
    selectedBirtDay = DateFormat('yyyy-MM-dd').format(parsedDate);
    update();
  }

  Future<void> uploadPersonalData() async {
    uploadPersonalDataLoading = true;
    update();
    var body = PersonalDataBody(
        firstName: firstnamaController.text,
        lastName: lastnamaController.text,
        identityNumber: ktpController.text,
        dateOfBirth: selectedBirtDay,
        gender: selectedGender == 0 ? "L" : "P",
        provinceId: selectedProvincies?.id ?? 0,
        cityId: selectedCities?.id ?? 0,
        address: addressController.text);
    final response = await _updatePersonalData(body);
    response.fold((error) {
      SnackBarHelper.showSnackBarError(Get.context!, error.message);
    }, (data) {});
    uploadPersonalDataLoading = false;
    update();
  }

  RxBool get isEnableBioButton {
    return RxBool(firstnamaValidated.value &&
        lastnamaValidated.value &&
        ktpValidated.value &&
        addressValidated.value &&
        selectedDatePicker != '' &&
        selectedProvincies != null &&
        selectedCities != null);
  }

  setDataBiodata(UserProfileData? userProfileData) {
    firstnamaController.text = userProfileData?.firstName ?? '';
    lastnamaController.text = userProfileData?.lastName ?? '';
    addressController.text = userProfileData?.address ?? '';
    selectedGender = userProfileData?.gender == 'L' ? 0 : 1;
    selectedBirtDay = userProfileData?.dateOfBirth ?? '';
    update();
  }

  @override
  void onInit() {
    getProvinces();
    super.onInit();
  }
}
