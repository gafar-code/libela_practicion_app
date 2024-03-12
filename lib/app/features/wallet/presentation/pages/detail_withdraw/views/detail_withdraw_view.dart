import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_withdraw_controller.dart';

class DetailWithdrawView extends GetView<DetailWithdrawController> {
  const DetailWithdrawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailWithdrawView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailWithdrawView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
