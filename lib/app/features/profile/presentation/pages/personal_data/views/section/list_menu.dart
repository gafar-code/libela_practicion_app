import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/personal_data/controllers/personal_data_controller.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../core/utils/assets/local_assets.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({super.key, required this.controller});

  final PersonalDataController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: theme.style.padding.allLarge,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => controller.actionMenu(index + 1),
            child: Container(
                padding: theme.style.padding.allMedium,
                decoration: BoxDecoration(
                    boxShadow: theme.style.shadow.medium,
                    color: kWhiteColor,
                    borderRadius: theme.style.borderRadius.allMedium,
                    border: theme.style.boder),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: kInfoColorAccent,
                      child:
                          LocalAssets.svg(controller.listMenu[index]['icon']),
                    ),
                    Gap(12.w),
                    Text(controller.listMenu[index]['title'],
                        style: theme.font.f14),
                    const Spacer(),
                    Icon(Icons.chevron_right_rounded, color: kSoftGrey)
                  ],
                )),
          );
        },
        separatorBuilder: (_, i) {
          return Gap(12.h);
        },
        itemCount: controller.listMenu.length);
  }
}
