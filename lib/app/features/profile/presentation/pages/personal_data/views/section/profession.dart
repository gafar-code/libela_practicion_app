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
import '../../controllers/edit_profession_controller.dart';

class ProffesionSection extends StatelessWidget {
  const ProffesionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfessionController>(builder: (controller) {
      return ListView(
        padding: theme.style.padding.allLarge,
        children: [
          Text('Pendidikan', style: theme.font.f14.regular),
          Gap(6.h),
          Container(
            height: 44.h,
            padding: theme.style.padding.allMedium,
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allSmall,
                color: kWhiteColor,
                border: theme.style.boder),
            child: DropdownButton<String>(
                value: controller.selectedEducation,
                isExpanded: true,
                underline: const SizedBox.shrink(),
                style: theme.font.f14.regular,
                hint: Text(
                  'Pilih Pendidikan',
                  style: theme.font.f14.copyWith(color: kSoftGrey),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: kSoftGrey,
                  size: 22.r,
                ),
                items: controller.educations
                    .map((e) =>
                        DropdownMenuItem<String>(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => controller.selectEducation(value!)),
          ),
          Gap(12.h),
          Text('Bidang', style: theme.font.f14.regular),
          Gap(6.h),
          Container(
            height: 44.h,
            padding: theme.style.padding.allMedium,
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allSmall,
                color: kWhiteColor,
                border: theme.style.boder),
            child: controller.proffesionLoading
                ? const Center(
                    child: CupertinoActivityIndicator(
                    color: kPrimaryAccentColor,
                  ))
                : DropdownButton<Proffesion>(
                    value: controller.selectedProffesion,
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    style: theme.font.f14.regular,
                    hint: Text(
                      'Pilih Bidang',
                      style: theme.font.f14.copyWith(color: kSoftGrey),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kSoftGrey,
                      size: 22.r,
                    ),
                    items: controller.proffesion
                        .map((e) => DropdownMenuItem<Proffesion>(
                            value: e, child: Text(e.professionName ?? '')))
                        .toList(),
                    onChanged: (value) => controller.selectProffesion(value!)),
          ),
          Gap(36.h),
          PrimaryButton(
            isLoading: controller.uploadProfessionDataLoading,
            text: 'Perbarui',
            onPressed: controller.selectedEducation != null &&
                    controller.selectedProffesion != null
                ? () => controller.updateProfession()
                : null,
          ),
        ],
      );
    });
  }
}
