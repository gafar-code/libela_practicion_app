import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/detail_appointment/controllers/detail_appointment_controller.dart';

import '../../../../../../../core/components/components_lib.dart';

class InformationOrder extends StatelessWidget {
  const InformationOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailAppointmentController>(builder: (controller) {
      return CustomExpansion(
        title: 'Informasi Pemesan',
        isExpanded: controller.isExpandedOrder,
        onTap: () => controller.expandOrder(),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              controller.detailAppointment?.customer?.name ?? '-',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
            Text(
              'Jenis Kelamin',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              controller.detailAppointment?.customer?.gender ?? '-',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
            Text(
              'No. HP',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              controller.detailAppointment?.customer?.phone ?? '-',
              style: theme.font.f12.semibold,
            ),
            Gap(12.h),
            Text(
              'Email',
              style: theme.font.f12.copyWith(color: kSoftGrey),
            ),
            Gap(4.h),
            Text(
              controller.detailAppointment?.customer?.email ?? '-',
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
                Expanded(
                  child: Text(
                    controller.detailAppointment?.customer?.address ?? '-',
                    style: theme.font.f12.semibold.copyWith(color: kInfoColor),
                  ),
                ),
                Gap(4.w),
                Icon(
                  Icons.edit,
                  color: kInfoColor,
                  size: 12.r,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
