import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/typedef.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../controllers/service_area.dart';

class ServiceAreaSection extends StatelessWidget {
  const ServiceAreaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterServiceAreaController>(builder: (controller) {
      return ListView(
        children: [
          Text('Daerah mana yang ingin kamu jangkau?',
              style: theme.font.f14.regular),
          Gap(6.h),
          Container(
            height: 44.h,
            padding: theme.style.padding.allMedium,
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allSmall,
                color: kWhiteColor,
                border: theme.style.boder),
            child: controller.serviceAreaLoading
                ? const Center(
                    child: CupertinoActivityIndicator(
                    color: kPrimaryAccentColor,
                  ))
                : DropdownButton<ServiceArea>(
                    value: controller.selectedServiceArea,
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    style: theme.font.f14.regular,
                    hint: Text(
                      'Pilih Service Area',
                      style: theme.font.f14.copyWith(color: kSoftGrey),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kSoftGrey,
                      size: 22.r,
                    ),
                    items: controller.serviceArea
                        .map((e) => DropdownMenuItem<ServiceArea>(
                            value: e, child: Text(e.name ?? '')))
                        .toList(),
                    onChanged: (value) => controller.selectServiceArea(value!)),
          ),
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
                            controller.specialization[index]),
                        iSelected: controller.selectedSpecializationServiceArea
                            .contains(controller.specialization[index]),
                        text: controller
                                .specialization[index].subProfessionName ??
                            '',
                      ))),
          Gap(36.h),
          MixButton(
            isLoading: controller.uploadServiceAreaDataLoading,
            textLeft: 'Kembali',
            textRight: 'Selanjutnya',
            onPressedLeft: () => controller.previous(),
            onPressedRight: controller.selectedServiceArea != null &&
                    controller.selectedSpecializationServiceArea.isNotEmpty
                ? () => controller.updateServiceArea()
                : null,
          )
        ],
      );
    });
  }
}
