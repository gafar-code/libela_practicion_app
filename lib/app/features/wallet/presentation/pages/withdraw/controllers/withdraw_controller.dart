import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/wallet/domain/usecase/get_bank_account.dart';
// import 'package:libela_practition/app/features/wallet/presentation/pages/wallet_page/controllers/wallet_page_controller.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/withdraw/views/widget/detail_withdraw.dart';

import '../../../../../../core/components/snackbar/app_snackbar.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../domain/entities/bank_account.dart';
import '../../../../domain/entities/wallet.dart';
import '../../../../domain/usecase/get_wallet.dart';
import '../../../utils/models/typedef.dart';

class WithdrawController extends GetxController {
  final GetWallet getWallet;
  final GetBankAccountsWallet getBankAccountWallet;
  WithdrawController(this.getWallet, this.getBankAccountWallet);
  TextEditingController amountController = TextEditingController();

  WalletEntity? wallet;
  BankAccounts bankAccounts = [];
  BankAccountEntity? selectedBank;

  var isHideSaldo = false;
  var isSwitch = false;
  var isChoiceRekening = false;
  var isLoading = false;

  Future<void> getWalletData() async {
    final result = await getWallet();
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      wallet = data;
      update();
    });
  }

  Future<void> getBankAccounts() async {
    final result = await getBankAccountWallet();
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      bankAccounts = data;
      update();
    });
  }

  void toggleHideSaldo() {
    isHideSaldo = !isHideSaldo;
    update();
  }

  void toggleSwitch() {
    isSwitch = !isSwitch;
    update();
  }

  void toggleChoiceRekening() {
    if (bankAccounts.isNotEmpty) {
      isChoiceRekening = !isChoiceRekening;
      update();
    }
  }

  void toAddRekening() {
    if (bankAccounts.length == 3) {
      AppSnackbar.show(message: 'Maksimal 3 rekening', type: SnackType.error);
    } else {
      Get.toNamed(Routes.ADD_REKENING_WITHDRAW);
    }
  }

  void selectBank(BankAccountEntity value) {
    selectedBank = value;
    isChoiceRekening = !isChoiceRekening;
    update();
  }

  void openDetailWithdraw() {
    CustomBottomSheet.show(child: DetailWithdraw());
  }

  Future<void> withdraw() async {
    isLoading = true;
    update();
    // Get.find<WalletPageController>().getWalletData();
    // Get.find<WalletPageController>().pagingController.refresh();

    await Future.delayed(2.seconds, () {
      Get.back();
      isLoading = false;
      update();
      Get.offNamed(Routes.WAITING_WITHDRAW);
    });
  }

  @override
  void onInit() {
    getWalletData();
    getBankAccounts();
    super.onInit();
  }
}
