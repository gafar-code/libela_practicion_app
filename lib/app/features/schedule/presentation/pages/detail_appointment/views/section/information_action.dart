import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/detail_appointment/controllers/detail_appointment_controller.dart';

import '../../../../../../../core/components/components_lib.dart';

class InformationAction extends StatelessWidget {
  const InformationAction({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailAppointmentController>(builder: (controller) {
      return Visibility(
        visible: controller.appointmentStatus == DetailAppointmentStatus.done,
        child: CustomExpansion(
          title: 'Informasi Tindakan',
          isExpanded: controller.isExpandedAction,
          onTap: () => controller.expandAction(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Berikut ini data tindakan pasien',
                style: theme.font.f12.semibold,
              ),
              Gap(12.h),
              Text(
                'Hasil Penilaian Kemampuan Fungsional',
                style: theme.font.f12.semibold,
              ),
              Gap(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1. Kemampuan Berjalan',
                    style: theme.font.f12.copyWith(color: kSoftGrey),
                  ),
                  Text(
                    'Skor 2',
                    style: theme.font.f12,
                  ),
                ],
              ),
              Gap(4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2. Kemampuan Berdiri',
                    style: theme.font.f12.copyWith(color: kSoftGrey),
                  ),
                  Text(
                    'Skor 2',
                    style: theme.font.f12,
                  ),
                ],
              ),
              Gap(12.h),
              Text(
                'Pengobatan & Intervensi Selama Kunjungan',
                style: theme.font.f12.semibold,
              ),
              Gap(8.h),
              Text(
                'Pemberian obat untuk menghentikan pembekuan darah dan mencegah adanya pembentukan gumpalan baru',
                style: theme.font.f12.copyWith(color: kSoftGrey),
              ),
              Gap(12.h),
              Text(
                'Rencana Perawatan Selanjutnya',
                style: theme.font.f12.semibold,
              ),
              Gap(8.h),
              Text(
                'Pemberian obat untuk menghentikan pembekuan darah dan mencegah adanya pembentukan gumpalan baru',
                style: theme.font.f12.copyWith(color: kSoftGrey),
              ),
              Gap(12.h),
              Text(
                'Catatan Tambahan',
                style: theme.font.f12.semibold,
              ),
              Gap(8.h),
              Text(
                'Pasien memiliki riwayat hipertensi yang tidak terkontrol, yang merupakan faktor risiko utama untuk stroke',
                style: theme.font.f12.copyWith(color: kSoftGrey),
              ),
            ],
          ),
        ),
      );
    });
  }
}
