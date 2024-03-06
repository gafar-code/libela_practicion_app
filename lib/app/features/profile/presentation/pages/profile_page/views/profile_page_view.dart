import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/views/section/app_bar.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/views/section/menu.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/views/section/profile.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarProfile(),
        body: ListView(
          padding: theme.style.padding.allLarge,
          children: [
            const ProfileSection(),
            MenuSection(
              controller: controller,
            )
          ],
        ));
  }
}
