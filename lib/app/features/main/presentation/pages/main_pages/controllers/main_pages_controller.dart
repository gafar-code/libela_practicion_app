import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/features/home/presentation/pages/dashboard/views/dashboard_view.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/views/profile_page_view.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/schedule_page/views/schedule_page_view.dart';

import '../../../../../../core/utils/assets/assets.dart';
import '../../../../../wallet/presentation/pages/wallet_page/views/wallet_page_view.dart';

class MainPagesController extends GetxController {
  int currentPageIndex = 0;

  void changePage(int index) {
    currentPageIndex = index;
    update();
  }

  List<dynamic> itemBar = [
    {'icon': home, 'label': 'Home'},
    {'icon': wallet, 'label': 'Wallet'},
    {'icon': schadule, 'label': 'Jadwal'},
    {'icon': home, 'label': 'Profile'},
  ];

  List<Widget> listPages = [
    const DashboardView(),
    const WalletPageView(),
    const SchedulePageView(),
    const ProfilePageView(),
  ];
}
