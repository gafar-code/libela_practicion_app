import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../controllers/edit_service_area.dart';

class ServiceAreaSection extends StatelessWidget {
  const ServiceAreaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditServiceAreaController>(builder: (controller) {
      return ListView(
        padding: theme.style.padding.allLarge,
        children: [
          Text('Daerah mana yang ingin kamu jangkau?',
              style: theme.font.f14.regular),
          Gap(6.h),
          Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: List.generate(
                  controller.serviceArea.length,
                  (index) => SelectButton(
                        onTap: () => controller
                            .selectServiceArea(controller.serviceArea[index]),
                        iSelected: controller.selectedServiceArea
                            .contains(controller.serviceArea[index]),
                        text: controller.serviceArea[index].name ?? '',
                      ))),
          Gap(26.h),
          Text('Layanan apa yang menarik buat kamu?',
              style: theme.font.f14.regular),
          Gap(12.h),
          Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: List.generate(
                  controller.specialization.length,
                  (index) => SelectButton(
                        onTap: () => controller.selectSpecializationServiceArea(
                            controller.specialization[index].id ?? ''),
                        iSelected: controller.selectedSpecializationServiceArea
                            .contains(controller.specialization[index].id),
                        text: controller
                                .specialization[index].subProfessionName ??
                            '',
                      ))),
          Gap(36.h),
          PrimaryButton(
              isLoading: controller.uploadServiceAreaDataLoading,
              text: 'Perbarui',
              onPressed: controller.selectedServiceArea.isNotEmpty &&
                      controller.selectedSpecializationServiceArea.isNotEmpty
                  ? () => controller.updateServiceArea()
                  : null),
        ],
      );
    });
  }
}
