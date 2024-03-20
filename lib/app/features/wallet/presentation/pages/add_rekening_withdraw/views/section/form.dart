import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/add_rekening_withdraw/controllers/add_rekening_withdraw_controller.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../../../../../../core/utils/screen_size.dart';
import '../../../../../domain/entities/banks.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddRekeningWithdrawController>(builder: (controller) {
      return ListView(
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
            child: DropdownButton<BanksEntity>(
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
                items: controller.banks
                    .map((e) => DropdownMenuItem<BanksEntity>(
                        value: e,
                        child: Text(
                          e.bankName ?? '',
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
            onChanged: (value) => controller.validatePlaceholder(value),
          ),
          Gap(12.h),
          AppForm(
            type: AppFormType.withLabel,
            controller: controller.rekeningNumberController,
            label: 'No. Rekening',
            hintText: 'Isi nomor rekening',
            keyboardType: TextInputType.number,
            onChanged: (value) => controller.validateRekeningNumber(value),
          ),
          Gap(12.h),
          AppForm(
            type: AppFormType.withLabel,
            controller: controller.confirmRekeningNumberController,
            label: 'Re-enter No. Rekening',
            hintText: 'Konfirmasi nomor rekening',
            keyboardType: TextInputType.number,
            onChanged: (value) =>
                controller.validateRekeningNumberConfirm(value),
          ),
          Gap(22.h),
          Container(
            padding: theme.style.padding.allMedium,
            width: getWidthScale(1),
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allMedium,
                color: kInfoColorAccent),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            isLoading: controller.isLoadingAddBank,
            text: 'Tambah',
            onPressed: controller.selectedBank != null &&
                    controller.isPlaceholderValidate &&
                    controller.isRekeningNumberValidate &&
                    controller.isRekeningNumberConfirmValidate
                ? () => controller.createBankAccount()
                : null,
          )
        ],
      );
    });
  }
}
