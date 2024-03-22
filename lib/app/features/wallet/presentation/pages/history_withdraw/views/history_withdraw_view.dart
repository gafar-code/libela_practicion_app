import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/history_withdraw/views/section/withdraw_history.dart';

import '../controllers/history_withdraw_controller.dart';
import 'section/app_bar.dart';
import 'section/filter.dart';

class HistoryWithdrawView extends GetView<HistoryWithdrawController> {
  const HistoryWithdrawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithdrawHistory(),
        body: CustomScrollView(slivers: [
          FilterSection(),
          WithdrawHistorySection(controller: controller)
        ]));
  }
}
