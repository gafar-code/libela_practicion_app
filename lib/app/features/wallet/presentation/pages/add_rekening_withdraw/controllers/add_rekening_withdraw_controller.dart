import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/features/wallet/domain/usecase/create_bank_account.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/withdraw/controllers/withdraw_controller.dart';

import '../../../../../../core/components/snackbar/app_snackbar.dart';
import '../../../../domain/entities/banks.dart';
import '../../../../domain/usecase/get_list_bank.dart';
import '../../../utils/models/bank_account_body.dart';
import '../../../utils/models/typedef.dart';

class AddRekeningWithdrawController extends GetxController {
  final GetListBankWallet _getListBank;
  final CreateBankAccountWallet _createBankAccount;

  AddRekeningWithdrawController(this._getListBank, this._createBankAccount);
  TextEditingController placeHolderController = TextEditingController();
  TextEditingController rekeningNumberController = TextEditingController();
  TextEditingController confirmRekeningNumberController =
      TextEditingController();

  bool isLoading = false;
  bool isLoadingAddBank = false;

  Banks banks = [];
  BankAccounts bankAccounts = [];
  BanksEntity? selectedBank;
  bool isPlaceholderValidate = false;
  bool isRekeningNumberValidate = false;
  bool isRekeningNumberConfirmValidate = false;

  Future<void> getListBank() async {
    final result = await _getListBank();
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      banks = data;
      update();
    });
  }

  Future<void> createBankAccount() async {
    isLoadingAddBank = true;
    update();
    var body = BankAccountBody(
        bankId: selectedBank?.bankId,
        bankAccount: rekeningNumberController.text,
        bankAccountName: placeHolderController.text,
        isPrimary: 0);
    final result = await _createBankAccount(body);
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      AppSnackbar.show(
          message: 'Berhasil tambah rekening bank', type: SnackType.success);
      Get.find<WithdrawController>().getBankAccounts();
      clearTextController();
    });
    isLoadingAddBank = false;
    update();
  }

  void validatePlaceholder(String value) {
    if (value.isNotEmpty) {
      isPlaceholderValidate = true;
    } else {
      isPlaceholderValidate = false;
    }
    update();
  }

  void validateRekeningNumber(String value) {
    if (value.isNotEmpty) {
      isRekeningNumberValidate = true;
    } else {
      isRekeningNumberValidate = false;
    }
    update();
  }

  void validateRekeningNumberConfirm(String value) {
    if (value.isNotEmpty && value == rekeningNumberController.text) {
      isRekeningNumberConfirmValidate = true;
    } else {
      isRekeningNumberConfirmValidate = false;
    }
    update();
  }

  void selectBank(BanksEntity value) {
    selectedBank = value;
    update();
  }

  clearTextController() {
    selectedBank = null;
    placeHolderController.clear();
    rekeningNumberController.clear();
    confirmRekeningNumberController.clear();
  }

  @override
  void onInit() {
    getListBank();
    super.onInit();
  }
}
