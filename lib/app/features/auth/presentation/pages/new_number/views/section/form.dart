import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/new_number/controllers/new_number_controller.dart';
import '../../../../../../../core/utils/assets/assets.dart';
import '../../../../../../../core/utils/assets/local_assets.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewNumberController>(builder: (controller) {
      return Padding(
        padding: theme.style.padding.allLarge,
        child: Column(
          children: [
            Row(
              children: [
                Text('No. HP', style: theme.font.f14),
                Gap(12.w),
                // Container(
                //   height: 44.h,
                //   width: 64.w,
                //   padding: theme.style.padding.copyWith(left: 8.w, right: 8.w),
                //   decoration: BoxDecoration(
                //       borderRadius: theme.style.borderRadius.allSmall,
                //       border: theme.style.boder,
                //       color: kWhiteColor),
                //   child: DropdownButton(
                //       value: controller.selectedCountry,
                //       isExpanded: true,
                //       underline: const SizedBox.shrink(),
                //       items: controller.countries
                //           .map((e) => DropdownMenuItem(
                //               value: e,
                //               child: SvgPicture.network(e.flag ?? '',
                //                   placeholderBuilder: (context) =>
                //                       const CupertinoActivityIndicator(
                //                         color: kPrimaryAccentColor,
                //                       ),
                //                   width: 34.w)))
                //           .toList(),
                //       onChanged: (value) => controller.selectCountry(value!)),
                // ),
                Container(
                  height: 44.h,
                  width: 54.w,
                  padding: theme.style.padding.allMedium,
                  decoration: BoxDecoration(
                      borderRadius: theme.style.borderRadius.allSmall,
                      border: theme.style.boder,
                      color: kWhiteColor),
                  child: LocalAssets.image(indo, height: 22.h),
                ),
                Gap(12.w),
                Expanded(
                    child: AppFormNumber(
                  controller: controller.numberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: controller.formaterNumber(),
                  onChanged: (value) => controller.listenPhoneForm(value),
                )),
              ],
            ),
            Gap(36.h),
            Obx(() {
              return PrimaryButton(
                isLoading: controller.resetPhoneNumberLoading.value,
                isExpanded: true,
                text: 'Simpan',
                onPressed: controller.isPhoneValidated.value
                    ? () => controller.changePhoneNumber()
                    : null,
              );
            }),
          ],
        ),
      );
    });
  }
}
