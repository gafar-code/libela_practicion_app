import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';

import '../../../../../../../core/components/components_lib.dart';

import '../../../../../../auth/presentation/utils/model/typedef.dart';
import '../../controllers/edit_biodata_controller.dart';

class BiodataSection extends StatelessWidget {
  const BiodataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditBiodataController>(builder: (controller) {
      return ListView(
        padding: theme.style.padding.allLarge,
        children: [
          AppForm(
            type: AppFormType.withLabel,
            controller: controller.firstnamaController,
            label: 'Nama Depan',
            hintText: 'Isi nama depan disini',
            onChanged: (value) => controller.listenFirstNameForm(value),
          ),
          Gap(12.h),
          AppForm(
            type: AppFormType.withLabel,
            controller: controller.lastnamaController,
            label: 'Nama Belakang',
            hintText: 'Isi nama belakang disini',
            onChanged: (value) => controller.listenLastNameForm(value),
          ),
          Gap(12.h),
          AppForm(
            type: AppFormType.withLabel,
            controller: controller.ktpController,
            label: 'Nomor ktp',
            hintText: 'Isi nomor ktp disini',
            keyboardType: TextInputType.number,
            onChanged: (value) => controller.listenKtpForm(value),
          ),
          Obx(
            () => Visibility(
              visible: controller.ktpValidated.isFalse,
              child: Padding(
                padding: theme.style.padding.topSmall,
                child: Row(children: [
                  Icon(Icons.info_rounded, size: 12.r, color: kErrorColor),
                  Gap(6.w),
                  Text(
                    'Nomor KTP harus 16 digit',
                    style: theme.font.f10.red,
                  ),
                ]),
              ),
            ),
          ),
          Gap(12.h),
          Text('Tanggal Lahir', style: theme.font.f14.regular),
          Gap(8.h),
          GestureDetector(
            onTap: () => controller.openCalendarView(),
            child: Container(
              height: 42.h,
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allSmall,
                  color: kWhiteColor,
                  border: theme.style.boder),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      controller.selectedDatePicker != ""
                          ? controller.selectedDatePicker
                          : 'Pilih Tanggal Lahir',
                      style: controller.selectedDatePicker != ""
                          ? theme.font.f14.regular
                          : theme.font.f14.regular.copyWith(color: kSoftGrey)),
                  LocalAssets.svg(date, color: kSoftGrey)
                ],
              ),
            ),
          ),
          Gap(12.h),
          Text('Jenis Kelamin', style: theme.font.f14.regular),
          Gap(6.h),
          Row(
            children: List.generate(
              controller.genders.length,
              (index) => SizedBox(
                height: 42.h,
                child: Row(children: [
                  GestureDetector(
                    onTap: () => controller.selectGender(index),
                    child: SizedBox(
                      height: 16.r,
                      width: 26.r,
                      child: Radio(
                        value: index,
                        groupValue: controller.selectedGender,
                        activeColor: kPrimaryColor,
                        onChanged: (value) {
                          controller.selectGender(value ?? 0);
                        },
                      ),
                    ),
                  ),
                  Gap(4.w),
                  Text(controller.genders[index],
                      style: theme.font.f14.regular),
                  Gap(16.w),
                ]),
              ),
            ),
          ),
          Gap(12.h),
          Text('Provinsi', style: theme.font.f14.regular),
          Gap(6.h),
          Container(
            height: 44.h,
            padding: theme.style.padding.allMedium,
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allSmall,
                color: kWhiteColor,
                border: theme.style.boder),
            child: controller.provincesLoading
                ? const Center(
                    child: CupertinoActivityIndicator(
                    color: kPrimaryAccentColor,
                  ))
                : DropdownButton<Provinces>(
                    value: controller.selectedProvincies,
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    style: theme.font.f14.regular,
                    hint: Text(
                      'Pilih Provinsi',
                      style: theme.font.f14.copyWith(color: kSoftGrey),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kSoftGrey,
                      size: 22.r,
                    ),
                    items: controller.provincies
                        .map((e) => DropdownMenuItem<Provinces>(
                            value: e, child: Text(e.name ?? '')))
                        .toList(),
                    onChanged: (value) => controller.selectProvincies(value!)),
          ),
          Gap(12.h),
          Text('Kota', style: theme.font.f14.regular),
          Gap(6.h),
          Container(
            height: 44.h,
            padding: theme.style.padding.allMedium,
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allSmall,
                color: controller.selectedProvincies == null
                    ? kSofterGrey
                    : kWhiteColor,
                border: theme.style.boder),
            child: controller.citiesLoading
                ? const Center(
                    child: CupertinoActivityIndicator(
                    color: kPrimaryAccentColor,
                  ))
                : DropdownButton<Cities>(
                    value: controller.selectedCities,
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    style: theme.font.f14.regular,
                    hint: Text(
                      'Pilih Kota',
                      style: theme.font.f14.copyWith(color: kSoftGrey),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kSoftGrey,
                      size: 22.r,
                    ),
                    items: controller.cities
                        .map((e) => DropdownMenuItem<Cities>(
                            value: e, child: Text(e.name ?? '')))
                        .toList(),
                    onChanged: (value) => controller.selectCities(value!)),
          ),
          Gap(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Alamat Tinggal', style: theme.font.f14.regular),
              // LocalAssets.svg(maps)
            ],
          ),
          Gap(6.h),
          AppForm(
            controller: controller.addressController,
            hintText: 'Isi alamat tinggal disini...',
            textArea: true,
            onChanged: (value) => controller.listenAddressForm(value),
          ),
          Gap(32.h),
          Obx(() {
            return PrimaryButton(
              isLoading: controller.uploadPersonalDataLoading,
              text: 'Perbarui',
              onPressed: controller.isEnableBioButton.value
                  ? () => controller.uploadPersonalData()
                  : null,
            );
          }),
        ],
      );
    });
  }
}
