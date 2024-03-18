import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/views/section/app_bar.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/views/section/menu.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/views/section/profile.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../config/theme/colors.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarProfile(),
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
            children: [
              const ProfileSection(),
              MenuSection(
                controller: controller,
              )
            ],
          ),
        ));
  }
}
