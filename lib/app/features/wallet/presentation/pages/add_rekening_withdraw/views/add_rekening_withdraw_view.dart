import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_rekening_withdraw_controller.dart';

class AddRekeningWithdrawView extends GetView<AddRekeningWithdrawController> {
  const AddRekeningWithdrawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddRekeningWithdrawView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddRekeningWithdrawView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
