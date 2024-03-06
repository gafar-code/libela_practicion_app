import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/home/presentation/pages/detail_appointment/controllers/detail_appointment_controller.dart';

import '../../../../../../../core/components/components_lib.dart';

class InformationPatient extends StatelessWidget {
  const InformationPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailAppointmentController>(builder: (controller) {
      return CustomExpansion(
        title: 'Informasi Pasien',
        isExpanded: controller.isExpandedPatient,
        onTap: () => controller.expandPatient(),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardImage.rectangle(
              size: 60.r,
              image:
                  'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            Gap(12.h),
            Text(
              'Nama Lengkap',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              'John Doe',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
            Text(
              'NIK',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              '2029181828281',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
            Text(
              'Tanggal Lahir',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              '15 Feb 2024',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
            Text(
              'Jenis Kelamin',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              'Laki-laki',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
            Text(
              'Email',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              'johndoe@gmail.com',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
            Text(
              'No. HP',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              '08981234567890',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
            Text(
              'Alamat',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Row(
              children: [
                Text(
                  'Jalan Merapi Raya 02, Bandung, Jawa Barat',
                  style: theme.font.f12.semibold.copyWith(color: kInfoColor),
                ),
                Gap(4.w),
              ],
            ),
            Gap(12.h),
            Text(
              'Keluhan Utama',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              'Kesemutan di sebelah kiri tubuh, kesulitan bicara',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
          ],
        ),
      );
    });
  }
}
