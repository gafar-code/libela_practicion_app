import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/snackbar/app_snackbar.dart';
import 'package:libela_practition/app/features/profile/domain/entities/bank_account.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/delete_bank_acount.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/get_bank_account.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/bank_account_body.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/typedef.dart';

import '../../../../../../core/components/dialog/confirmation_dialog.dart';
import '../../../../domain/entities/banks.dart';
import '../../../../domain/usecase/create_bank_account.dart';
import '../../../../domain/usecase/get_list_bank.dart';
import '../../../utils/model/delete_bank_account_body.dart';

class BankRekeningController extends GetxController {
  final GetListBank _getListBank;
  final GetBankAccounts _getBankAccounts;
  final CreateBankAccount _createBankAccount;
  final DeleteBankAccount _deleteBankAccount;

  BankRekeningController(this._getListBank, this._getBankAccounts,
      this._createBankAccount, this._deleteBankAccount);
  PageController pageController = PageController();
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

  Future<void> getBankAccounts() async {
    isLoading = true;
    update();
    final result = await _getBankAccounts();
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      bankAccounts = data;
      update();
    });
    isLoading = false;
    update();
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
      getBankAccounts();
      clearTextController();
    });
    isLoadingAddBank = false;
    update();
  }

  Future<void> setToPrimary(BankAccountEntity bank) async {
    var body = BankAccountBody(
        bankId: bank.bankId,
        bankAccount: bank.bankAccount,
        bankAccountName: bank.bankAccountName,
        isPrimary: 1);
    final result = await _createBankAccount(body);
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      final hasPrimaryBank = bankAccounts.any((e) => e.isPrimaryBank == 1);
      if (hasPrimaryBank) {
        bankAccounts = [
          ...bankAccounts.map((e) {
            if (e.bankId == bank.bankId) {
              return e.copyWith(isPrimaryBank: 1);
            } else if (e.isPrimaryBank == 1) {
              return e.copyWith(isPrimaryBank: 0);
            }
            return e;
          })
        ];
      } else {
        bankAccounts = [
          ...bankAccounts.map((e) {
            if (e.bankId == bank.bankId) {
              return e.copyWith(isPrimaryBank: 1);
            }
            return e;
          })
        ];
      }

      update();
      AppSnackbar.show(
          message: 'Berhasil menjadikan rekening utama',
          type: SnackType.success);
    });
  }

  Future<void> deleteRekening(BankAccountEntity bank) async {
    Get.back();
    var body = DeleteBankAccountBody(bankAccount: bank.bankAccount);
    final result = await _deleteBankAccount(body);
    result.fold(
      (error) {
        AppSnackbar.show(message: error.message, type: SnackType.error);
      },
      (data) {
        AppSnackbar.show(message: 'Berhasil hapus rekening bank');
        bankAccounts.removeWhere((e) => e.bankId == bank.bankId);
        update();
      },
    );
  }

  void selectBank(BanksEntity value) {
    selectedBank = value;
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

  void confirmAction(BankAccountEntity bank) {
    ConfirmationDialog.show(
      title: 'Hapus Rekening',
      message: 'Yakin ingin menghapus rekening bank ini?',
      onTapText: 'hapus',
      onPressed: () => deleteRekening(bank),
    );
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

  @override
  void onInit() {
    getListBank();
    getBankAccounts();
    super.onInit();
  }
}
