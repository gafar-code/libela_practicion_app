import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';

import '../../controllers/bank_rekening_controller.dart';
import 'app_bar.dart';

class AddBankRekening extends StatelessWidget {
  const AddBankRekening({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankRekeningController>(builder: (controller) {
      return Scaffold(
          appBar: const AppBarEditBank(title: 'Tambah Rekening'),
          body: ListView(
            padding: theme.style.padding.allLarge,
            children: [
              Text('Nama Bank', style: theme.font.f14.regular),
              Gap(6.h),
              Container(
                height: 44.h,
                padding: theme.style.padding.allMedium,
                decoration: BoxDecoration(
                    borderRadius: theme.style.borderRadius.allSmall,
                    color: kWhiteColor,
                    border: theme.style.boder),
                child: DropdownButton<String>(
                    value: controller.selectedBank,
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    style: theme.font.f14.regular,
                    hint: Text(
                      'Pilih Bank',
                      style: theme.font.f14.copyWith(color: kSoftGrey),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kSoftGrey,
                      size: 22.r,
                    ),
                    items: controller.listBank
                        .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(
                              e,
                              style: theme.font.f14,
                            )))
                        .toList(),
                    onChanged: (value) => controller.selectBank(value!)),
              ),
              Gap(12.h),
              AppForm(
                type: AppFormType.withLabel,
                controller: controller.placeHolderController,
                label: 'Nama Pemilik Rekening',
                hintText: 'Isi nama pemilik rekening',
              ),
              Gap(12.h),
              AppForm(
                type: AppFormType.withLabel,
                controller: controller.rekeningNumberController,
                label: 'No. Rekening',
                hintText: 'Isi nomor rekening',
              ),
              Gap(12.h),
              AppForm(
                type: AppFormType.withLabel,
                controller: controller.confirmRekeningNumberController,
                label: 'Re-enter No. Rekening',
                hintText: 'Konfirmasi nomor rekening',
              ),
              Gap(22.h),
              Container(
                padding: theme.style.padding.allMedium,
                width: getWidthScale(1),
                decoration: BoxDecoration(
                    borderRadius: theme.style.borderRadius.allMedium,
                    color: kInfoColorAccent),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: kInfoColor,
                      size: 16.r,
                    ),
                    Gap(12.w),
                    Expanded(
                      child: Text(
                          'Pastikan Nama pemilik Rekening sama dengan Nama yang terdaftar di Libela',
                          style: theme.font.f14),
                    )
                  ],
                ),
              ),
              Gap(32.h),
              PrimaryButton(
                text: 'Tambah',
                onPressed: () => controller.addRekening(),
              )
            ],
          ));
    });
  }
}
