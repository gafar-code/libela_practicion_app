import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

import '../../../../../../profile/presentation/pages/profile_page/controllers/profile_page_controller.dart';

class RegisterNotFinish extends StatelessWidget {
  const RegisterNotFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(builder: (controller) {
      return Visibility(
          visible: controller.currentStepRegister != null,
          child: Padding(
            padding: theme.style.padding.bottomLarge,
            child: Container(
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allSmall,
                  color: kWarningColorAccent),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: kWarningColor,
                        child: LocalAssets.svg(profile),
                      ),
                      Gap(12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Data kamu belum lengkap.',
                                style: theme.font.f14
                                    .copyWith(color: kWarningColor)
                                    .medium),
                            Gap(2.h),
                            Text(
                              'Lengkapi data kamu yuk, agar segera bisa melakukan pelayanan',
                              style:
                                  theme.font.f12.copyWith(color: kWarningColor),
                            ),
                            Gap(8.h),
                            GestureDetector(
                              onTap: () => Get.offAllNamed(Routes.REGISTER_FORM,
                                  arguments: [
                                    controller.currentStepRegister,
                                    controller.userProfileData
                                  ]),
                              child: Text('Lanjutkan Registrasi',
                                  style: theme.font.f12
                                      .copyWith(color: kInfoColor)),
                            )
                          ],
                        ),
                      ),
                      Gap(8.w),
                      GestureDetector(
                        child: Icon(
                          Icons.close,
                          color: kSoftGrey,
                          size: 18.r,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
