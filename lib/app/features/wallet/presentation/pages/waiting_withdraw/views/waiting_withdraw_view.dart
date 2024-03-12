import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/waiting_withdraw_controller.dart';

class WaitingWithdrawView extends GetView<WaitingWithdrawController> {
  const WaitingWithdrawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WaitingWithdrawView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WaitingWithdrawView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
