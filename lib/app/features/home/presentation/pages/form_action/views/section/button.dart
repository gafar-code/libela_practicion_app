import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/home/presentation/pages/form_action/controllers/form_action_controller.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormActionController>(builder: (controller) {
      return Container(
        height: 72.h,
        padding: theme.style.padding.allLarge,
        decoration: BoxDecoration(
            color: kWhiteColor, boxShadow: theme.style.shadow.small),
        child: PrimaryButton(
          isExpanded: true,
          text: 'Akhiri Sesi',
          onPressed: () => controller.confirmationEndSession(),
        ),
      );
    });
  }
}
