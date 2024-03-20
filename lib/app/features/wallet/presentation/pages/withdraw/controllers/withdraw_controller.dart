import 'package:get/get.dart';
import 'package:libela_practition/app/features/wallet/domain/usecase/get_bank_account.dart';

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

  WalletEntity? wallet;
  BankAccounts bankAccounts = [];
  BankAccountEntity? selectedBank;

  var isHideSaldo = false;
  var isSwitch = false;
  var isChoiceRekening = false;

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
    print("Jalan");
    selectedBank = value;
    isChoiceRekening = !isChoiceRekening;
    update();
  }

  @override
  void onInit() {
    getWalletData();
    getBankAccounts();
    super.onInit();
  }
}
