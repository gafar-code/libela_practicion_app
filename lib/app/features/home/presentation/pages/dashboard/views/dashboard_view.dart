import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/home/presentation/pages/dashboard/views/section/register_not_finish.dart';
import 'package:libela_practition/app/features/home/presentation/pages/dashboard/views/section/visit_shedule.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../config/theme/colors.dart';
import '../controllers/dashboard_controller.dart';
import 'section/app_bar.dart';
// import 'section/income.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDashboard(),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        header: WaterDropHeader(
          waterDropColor: kPrimaryColor,
          complete: SizedBox.shrink(),
          refresh: CupertinoActivityIndicator(
            color: kSoftGrey,
          ),
        ),
        child: ListView(
          padding: theme.style.padding.allLarge,
          children: const [
            RegisterNotFinish(),
            VisitShedule(),
            // Income()
          ],
        ),
      ),
    );
  }
}
