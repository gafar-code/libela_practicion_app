import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_rekening_withdraw_controller.dart';
import 'section/app_bar.dart';
import 'section/form.dart';

class AddRekeningWithdrawView extends GetView<AddRekeningWithdrawController> {
  const AddRekeningWithdrawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarAddRekeningWallet(), body: FormSection());
  }
}
