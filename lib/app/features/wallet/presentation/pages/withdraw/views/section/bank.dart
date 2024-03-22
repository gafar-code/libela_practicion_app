import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/withdraw/controllers/withdraw_controller.dart';
import '../../../../../../../core/utils/screen_size.dart';

class BankSection extends StatelessWidget {
  const BankSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawController>(builder: (controller) {
      return Padding(
        padding: theme.style.padding.horizontalLarge,
        child: Column(
          children: [
            Container(
              padding: theme.style.padding.allMedium,
              width: getWidthScale(1),
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allMedium,
                  color: kSofterGrey),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pilih Rekening',
                      style: theme.font.f14,
                    ),
                    Gap(12.h),
                    Row(
                      children: [
                        Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () => controller.toggleChoiceRekening(),
                              child: Container(
                                padding: theme.style.padding.allSmall,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        theme.style.borderRadius.allSmall,
                                    border: Border.all(
                                        color: controller.isChoiceRekening
                                            ? kPrimaryColor
                                            : kSoftGrey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Pilih rekening',
                                        style: theme.font.f12.copyWith(
                                            color: controller.isChoiceRekening
                                                ? kPrimaryColor
                                                : kSoftGrey)),
                                    Icon(
                                        controller.isChoiceRekening
                                            ? Icons.keyboard_arrow_up_rounded
                                            : Icons.keyboard_arrow_down_rounded,
                                        color: controller.isChoiceRekening
                                            ? kPrimaryColor
                                            : kSoftGrey)
                                  ],
                                ),
                              ),
                            )),
                        Gap(12.w),
                        Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () => controller.toAddRekening(),
                              child: Container(
                                padding: theme.style.padding.allSmall,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        theme.style.borderRadius.allSmall,
                                    border: Border.all(color: kPrimaryColor)),
                                child: Row(
                                  children: [
                                    Icon(Icons.add_circle_rounded,
                                        color: kPrimaryColor),
                                    Gap(8.w),
                                    Text('Tambah Rekening',
                                        style: theme.font.f12
                                            .copyWith(color: kPrimaryColor)),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                    Stack(clipBehavior: Clip.none, children: [
                      Visibility(
                          visible: controller.selectedBank != null,
                          child: Padding(
                            padding: theme.style.padding.topLarge,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //     height: 32.h,
                                //     width: 56.w,
                                //     decoration: BoxDecoration(
                                //         borderRadius:
                                //             theme.style.borderRadius.allSmall,
                                //         color: kWhiteColor)),
                                CircleAvatar(
                                  radius: 16.r,
                                  backgroundColor: kWhiteColor,
                                  child: Icon(
                                    Icons.account_balance_outlined,
                                  ),
                                ),
                                Gap(12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: getWidthScale(1.6),
                                      child: Text(
                                          controller.selectedBank?.bankAlias ??
                                              '',
                                          style: theme.font.f12),
                                    ),
                                    Gap(4.h),
                                    Text(
                                        controller.selectedBank?.bankAccount ??
                                            '',
                                        style: theme.font.f12.semibold),
                                    Text(
                                        controller.selectedBank
                                                ?.bankAccountName ??
                                            '',
                                        style: theme.font.f12),
                                  ],
                                )
                              ],
                            ),
                          )),
                      Visibility(
                        visible: controller.isChoiceRekening,
                        child: Padding(
                          padding: theme.style.padding.verticalMedium,
                          child: Container(
                            padding: theme.style.padding.allSmall,
                            width: getWidthScale(2.5),
                            decoration: BoxDecoration(
                                borderRadius: theme.style.borderRadius.allSmall,
                                color: kWhiteColor,
                                boxShadow: theme.style.shadow.small),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    controller.bankAccounts.length,
                                    (index) => Padding(
                                          padding:
                                              theme.style.padding.bottomSmall,
                                          child: GestureDetector(
                                            onTap: () => controller.selectBank(
                                                controller.bankAccounts[index]),
                                            child: Text(
                                                "${controller.bankAccounts[index].bankAlias} - ${controller.bankAccounts[index].bankAccount} - ${controller.bankAccounts[index].bankAccountName}",
                                                style: theme.font.f12.copyWith(
                                                    color:
                                                        controller.bankAccounts[
                                                                    index] ==
                                                                controller
                                                                    .selectedBank
                                                            ? kPrimaryColor
                                                            : kSoftGrey)),
                                          ),
                                        ))),
                          ),
                        ),
                      ),
                    ]),
                  ]),
            ),
            Gap(16.h),
            PrimaryButton(
              isExpanded: true,
              text: 'Lanjutkan',
              onPressed: () => controller.openDetailWithdraw(),
            )
          ],
        ),
      );
    });
  }
}
