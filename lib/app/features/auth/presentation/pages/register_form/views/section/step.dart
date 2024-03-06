import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/controllers/register_form_controller.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/views/widget/custom_step_register.dart';

class StepSection extends StatelessWidget {
  const StepSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterFormController>(builder: (controller) {
      return Container(
        padding: theme.style.padding.allLarge,
        child: Column(
          children: [
            CustomStepperRegister(currentStep: controller.currentIndex),
            Gap(22.h),
            Text(
              controller.tabForm[controller.currentIndex],
              style: theme.font.f16.semibold,
            )
          ],
        ),
      );
    });
  }
}
