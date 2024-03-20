import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/withdraw_controller.dart';
import 'section/app_bar.dart';
import 'section/bank.dart';
import 'section/wallet.dart';

class WithdrawView extends GetView<WithdrawController> {
  const WithdrawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithdrawWallet(),
      body: ListView(
        children: [WalletSection(), BankSection()],
      ),
    );
  }
}
