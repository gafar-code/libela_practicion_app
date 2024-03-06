import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/dialog/confirmation_dialog.dart';

class FormActionController extends GetxController {
  PageController pageController = PageController();
  TextEditingController interventionalTreatmentController =
      TextEditingController();
  TextEditingController treatmentPlanController = TextEditingController();
  TextEditingController postscriptController = TextEditingController();

  List<String> functionalAbilities = [
    'Kemampuan Berjalan',
    'Kemampuan Berdiri',
    'Kemampuan Mengangkat Benda',
    'Kemampuan Aktivitas Sehari-hari'
  ];

  List<String> selectedFunctionalAbilities = [];
  List<int> selectedScors = [];

  void selectFunctionalAbilities(String value, int index) {
    if (selectedFunctionalAbilities.contains(value)) {
      selectedFunctionalAbilities.remove(value);
    } else {
      selectedFunctionalAbilities.add(value);
    }
    selectedScors[index] = 0;
    update();
  }

  void selectScors(int value, int index) {
    selectedScors[index] = value;
    update();
  }

  void confirmationEndSession() {
    ConfirmationDialog.show(
        title: 'Akhiri Sesi',
        message: 'Yakin ingin mengakhiri sesi kunjungan?',
        onTapText: 'Akhiri Sesi',
        onPressed: () {
          Get.back();
          successEndSession();
        });
  }

  void successEndSession() async {
    await Future.delayed(2.seconds, () {
      pageController.nextPage(
          duration: 10.milliseconds, curve: Curves.slowMiddle);
    });
  }

  @override
  void onInit() {
    selectedScors = List.generate(functionalAbilities.length, (index) => 0);
    super.onInit();
  }
}
