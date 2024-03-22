import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/bank_rekening/controllers/bank_rekening_controller.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/bank_rekening/views/section/app_bar.dart';

import '../../../../../../../config/theme/colors.dart';

class ListBankRekening extends StatelessWidget {
  const ListBankRekening({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankRekeningController>(builder: (controller) {
      return Scaffold(
          appBar: const AppBarEditBank(
            title: 'Rekening Bank',
          ),
          body: ListView(
            padding: theme.style.padding.allLarge,
            children: [
              if (controller.isLoading)
                SizedBox(
                    height: 120.h,
                    child: const Center(
                        child: CupertinoActivityIndicator(
                      color: kPrimaryColor,
                    )))
              else
                Column(
                  children: List.generate(
                      controller.bankAccounts.length,
                      (index) => Padding(
                          padding: theme.style.padding.bottomLarge,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   height: 42.h,
                              //   width: 56.w,
                              //   padding: theme.style.padding.allMedium,
                              //   decoration: BoxDecoration(
                              //       borderRadius:
                              //           theme.style.borderRadius.allSmall,
                              //       color: kWhiteColor,
                              //       border: theme.style.boder),
                              // ),
                              // Gap(12.w),
                              CircleAvatar(
                                radius: 20.r,
                                backgroundColor:
                                    kInfoColorAccent.withOpacity(0.4),
                                child: Icon(
                                  Icons.account_balance_outlined,
                                  size: 20.r,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Gap(12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller.bankAccounts[index]
                                                .bankAlias ??
                                            '',
                                        style: theme.font.f14),
                                    Gap(4.h),
                                    Text(
                                        controller.bankAccounts[index]
                                                .bankAccount ??
                                            '',
                                        style: theme.font.f14.semibold),
                                    Gap(4.h),
                                    Text(
                                        controller.bankAccounts[index]
                                                .bankAccountName ??
                                            '',
                                        style: theme.font.f14),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Visibility(
                                    visible: controller.bankAccounts[index]
                                            .isPrimaryBank ==
                                        1,
                                    child: Padding(
                                      padding: theme.style.padding.leftSmall,
                                      child: Container(
                                        height: 28.h,
                                        padding: theme
                                            .style.padding.horizontalMedium,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              theme.style.borderRadius.allLarge,
                                          color: kSuccessColor.withOpacity(0.2),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Utama',
                                            style: theme.font.f12.green,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(12.w),
                                  PopupMenuButton<String>(
                                      color: kWhiteColor,
                                      surfaceTintColor: kWhiteColor,
                                      padding:
                                          theme.style.padding.horizontalMedium,
                                      shadowColor: kBlackColor.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: theme
                                              .style.borderRadius.allSmall),
                                      itemBuilder: (BuildContext context) => [
                                            PopupMenuItem<String>(
                                              value: 'edit',
                                              padding: theme.style.padding
                                                  .horizontalMedium,
                                              child: Text(
                                                'Jadikan Rekening Utama',
                                                style: theme.font.f14,
                                              ),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'delete',
                                              padding: theme.style.padding
                                                  .horizontalMedium,
                                              child: Text('Hapus Rekening',
                                                  style: theme.font.f14
                                                      .copyWith(
                                                          color: kErrorColor)),
                                            )
                                          ],
                                      onSelected: (String value) {
                                        switch (value) {
                                          case 'edit':
                                            controller.setToPrimary(
                                                controller.bankAccounts[index]);
                                            break;
                                          case 'delete':
                                            controller.confirmAction(
                                                controller.bankAccounts[index]);
                                            break;
                                        }
                                      },
                                      child: Icon(
                                        Icons.more_vert_rounded,
                                        color: kSoftGrey,
                                      ))
                                ],
                              )
                            ],
                          ))),
                ),
              Gap(22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info_rounded, color: kSoftGrey, size: 16.r),
                  Gap(12.w),
                  Text(
                    'Maksimal 3 Rekening',
                    style: theme.font.f12.copyWith(color: kSoftGrey),
                  )
                ],
              ),
              Gap(32.h),
              PrimaryButton(
                text: 'Tambah',
                onPressed: controller.bankAccounts.length < 3
                    ? () => controller.toAddRekening()
                    : null,
              )
            ],
          ));
    });
  }
}
