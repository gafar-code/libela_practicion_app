import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:libela_practition/app/core/utils/snackbar_helper.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_email_data.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_personal_data.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/controllers/register_form_controller.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/personal_data_body.dart';

import '../../../../../../core/components/components_lib.dart';
import '../../../../../profile/presentation/utils/model/typedef.dart';
import '../../../../domain/usecase/get_cities.dart';
import '../../../../domain/usecase/get_provinces.dart';
import '../../../utils/model/email_body.dart';
import '../../../utils/model/typedef.dart';
import '../views/widget/picker_date.dart';

class RegisterBiodataController extends GetxController {
  final GetProvinces _getProvinces;
  final GetCities _getCities;
  final UpdatePersonalData _updatePersonalData;
  final UpdateEmailData _updateEmailData;
  RegisterBiodataController(this._getProvinces, this._getCities,
      this._updatePersonalData, this._updateEmailData);

  final registerController = Get.find<RegisterFormController>();

  TextEditingController firstnamaController = TextEditingController();
  TextEditingController lastnamaController = TextEditingController();
  TextEditingController ktpController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  UserProfileData? userProfileData;

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

  void listenEmailForm(String value) {
    if (value.isNotEmpty) {
      if (validateEmail(value)) {
        isEmailValidated(true);
      } else {
        isEmailValidated(false);
      }
    } else {
      isEmailValidated(false);
    }
  }

  bool validateEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  Future<void> getProvinces() async {
    provincesLoading = true;
    update();
    final response = await _getProvinces();
    response.fold((error) {
      SnackBarHelper.showSnackBarError(Get.context!, error.message);
    }, (data) {
      provincies = data;
      setProvinceData();
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

  void previous() {
    registerController.previous();
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
    }, (data) {
      registerController.next();
    });
    uploadPersonalDataLoading = false;
    update();
  }

  Future<void> uploadEmailData() async {
    uploadEmailDataLoading = true;
    update();
    var body = EmailBody(email: emailController.text);
    final response = await _updateEmailData(body);
    response.fold((error) {
      SnackBarHelper.showSnackBarError(Get.context!, error.message);
    }, (data) {
      registerController.next();
    });
    uploadEmailDataLoading = false;
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

  void setBioData() {
    if (Get.arguments != null) {
      if (Get.arguments[1] != null) {
        userProfileData = Get.arguments[1];
        if (isBiodataNotNull) {
          firstnamaController.text = userProfileData?.firstName ?? "";
          lastnamaController.text = userProfileData?.lastName ?? "";
          ktpController.text = userProfileData?.identityNumber ?? "";
          addressController.text = userProfileData?.address ?? "";
          selectedDatePicker = userProfileData?.dateOfBirth ?? "";
          selectedBirtDay = formatDate(userProfileData?.dateOfBirth ?? "");
          selectedGender = userProfileData?.gender == "L" ? 0 : 1;
          update();
        }
      }
    }
  }

  String formatDate(String dateString) {
    DateFormat inputFormat = DateFormat('dd-MM-yyyy');
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    DateTime parsedDate = inputFormat.parse(dateString);
    String formattedDate = outputFormat.format(parsedDate);

    return formattedDate;
  }

  void setEmailData() {
    if (Get.arguments[1] != null) {
      if (nullCheck(userProfileData?.email)) {
        emailController.text = userProfileData?.email ?? "";
        update();
        isEmailValidated(true);
      }
    }
  }

  void setProvinceData() {
    if (Get.arguments[1] != null) {
      if (isProvinceNotNull) {
        selectedProvincies =
            provincies.firstWhere((e) => e.id == userProfileData?.provinceId);
        getCities(selectedProvincies?.id ?? 0).whenComplete(() {
          selectedCities =
              cities.firstWhere((e) => e.id == userProfileData?.cityId);
        });
        ktpValidated(true);
        addressValidated(true);
        firstnamaValidated(true);
        lastnamaValidated(true);
        isEnableBioButton(true);
      }
      update();
    }
  }

  bool get isBiodataNotNull {
    return nullCheck(userProfileData?.firstName) &&
        nullCheck(userProfileData?.lastName) &&
        nullCheck(userProfileData?.address) &&
        nullCheck(userProfileData?.identityNumber) &&
        nullCheck(userProfileData?.dateOfBirth) &&
        nullCheck(userProfileData?.gender);
  }

  bool get isProvinceNotNull {
    return nullCheck(userProfileData?.provinceId) &&
        nullCheck(userProfileData?.cityId);
  }

  bool nullCheck(dynamic value) {
    return value != null &&
        value != '' &&
        value != 0 &&
        !(value is List && value.isEmpty);
  }

  @override
  void onInit() {
    setBioData();
    setEmailData();
    getProvinces();
    super.onInit();
  }
}
