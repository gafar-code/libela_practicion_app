import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wallet_page_controller.dart';
import 'section/app_bar.dart';

class WalletPageView extends GetView<WalletPageController> {
  const WalletPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWallet(controller: controller),
    );
  }
}
