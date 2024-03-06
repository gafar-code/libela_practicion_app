// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/bank_rekening/views/section/add_rekening.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/bank_rekening/views/section/list_rekening.dart';

import '../controllers/bank_rekening_controller.dart';

class BankRekeningView extends GetView<BankRekeningController> {
  const BankRekeningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.pageController.page == 1) {
          controller.backToRekening();
          return false;
        } else {
          return true;
        }
      },
      child: PageView.builder(
          itemCount: 2,
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            if (index == 0) {
              return const ListBankRekening();
            } else {
              return const AddBankRekening();
            }
          }),
    );
  }
}
