import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_withdraw_controller.dart';

class HistoryWithdrawView extends GetView<HistoryWithdrawController> {
  const HistoryWithdrawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryWithdrawView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryWithdrawView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
