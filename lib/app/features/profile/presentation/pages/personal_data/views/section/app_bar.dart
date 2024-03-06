import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/personal_data/controllers/personal_data_controller.dart';

class AppBarEditProfile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      title: GetBuilder<PersonalDataController>(builder: (controller) {
        return Text(
            controller.currentPage != 0
                ? controller.listMenu[controller.currentPage - 1]['title']
                : 'Personal Data',
            style: theme.font.f16.medium);
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
