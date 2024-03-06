import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/components/dialog/confirmation_dialog.dart';

class BankRekeningController extends GetxController {
  PageController pageController = PageController();
  TextEditingController placeHolderController = TextEditingController();
  TextEditingController rekeningNumberController = TextEditingController();
  TextEditingController confirmRekeningNumberController =
      TextEditingController();

  List<String> listBank = ['BCA', 'BRI', 'BNI', 'Mandiri'];
  List<dynamic> listRekening = [];

  String? selectedBank;

  void selectBank(String value) {
    selectedBank = value;
    update();
  }

  void addRekening() {
    listRekening.add({
      'bank': selectedBank,
      'rekening': rekeningNumberController.text,
      'placeholder': placeHolderController.text,
      'isPriority': false
    });
    update();
  }

  void confirmAction(int index) {
    ConfirmationDialog.show(
      title: 'Hapus Rekening',
      message: 'Yakin ingin menghapus rekening bank ini?',
      onTapText: 'hapus',
      onPressed: () => deleteRekening(index),
    );
  }

  void deleteRekening(int index) {
    Get.back();
    listRekening.removeAt(index);
    update();
  }

  void editRekening(int index) {
    listRekening[index]['isPriority'] = true;
    update();
  }

  clearTextController() {
    selectedBank = null;
    placeHolderController.clear();
    rekeningNumberController.clear();
    confirmRekeningNumberController.clear();
  }

  // Page Transition

  void toAddRekening() {
    pageController.nextPage(
        duration: 10.milliseconds, curve: Curves.slowMiddle);
    clearTextController();
    update();
  }

  void backToRekening() {
    pageController.previousPage(
        duration: 10.milliseconds, curve: Curves.slowMiddle);
    update();
  }
}
