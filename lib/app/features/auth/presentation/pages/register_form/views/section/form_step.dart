import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/controllers/register_form_controller.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/views/section/biodata.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/views/section/document.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/views/section/email.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/views/section/profession.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/views/section/service_area.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';

class FormStepSection extends StatelessWidget {
  const FormStepSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterFormController>(builder: (controller) {
      return Positioned.fill(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Gap(getHeightScale(4.4) - kToolbarHeight),
          Container(
            padding: theme.style.padding.allLarge,
            height: getHeightScale(1.24) - kToolbarHeight,
            decoration: BoxDecoration(
                color: kWhiteColor,
                boxShadow: theme.style.shadow.top,
                borderRadius: theme.style.borderRadius.copyWith(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            child: view(controller.currentIndex),
          ),
        ],
      )));
    });
  }

  Widget view(int index) {
    switch (index) {
      case 0:
        return const BiodataSection();
      case 1:
        return const EmailSection();
      case 2:
        return const ProffesionSection();
      case 3:
        return const ServiceAreaSection();
      default:
        return const DocumentSection();
    }
  }
}
