import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/controllers/profile_page_controller.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key, required this.controller});

  final ProfilePageController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => controller.actionMenu(index),
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
          if (i != 0) {
            return Gap(12.h);
          } else {
            return Padding(
              padding: theme.style.padding.verticalLarge,
              child: Text('Settings', style: theme.font.f14.semibold),
            );
          }
        },
        itemCount: controller.listMenu.length);
  }
}
