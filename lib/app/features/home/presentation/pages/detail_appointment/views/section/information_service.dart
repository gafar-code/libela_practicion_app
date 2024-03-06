import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/home/presentation/pages/detail_appointment/controllers/detail_appointment_controller.dart';

import '../../../../../../../core/components/components_lib.dart';

class InformationService extends StatelessWidget {
  const InformationService({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailAppointmentController>(builder: (controller) {
      return CustomExpansion(
        title: 'Informasi Layanan',
        isExpanded: controller.isExpandedService,
        onTap: () => controller.expandService(),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [content(controller.appointmentStatus, controller)],
        ),
      );
    });
  }

  Widget content(
      DetailAppointmentStatus status, DetailAppointmentController controller) {
    switch (status) {
      case DetailAppointmentStatus.sessionStart:
        return _sessionStart(controller);
      case DetailAppointmentStatus.done:
        return _done(controller);
      default:
        return _notStarted(controller);
    }
  }

  Widget _notStarted(DetailAppointmentController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.h),
      child: Center(
        child: Text(
          'Layanan akan tersedia apabila sesi kunjungan telah dimulai.',
          style: theme.font.f12.copyWith(color: kSoftGrey),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _sessionStart(DetailAppointmentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Silakan lengkapi data kesehatan pasien berikut ini.',
          style: theme.font.f12,
        ),
        Gap(12.h),
        Text(
          'Keluhan Utama',
          style: theme.font.f12.semibold,
        ),
        Gap(8.h),
        Container(
          padding: theme.style.padding.allMedium,
          width: getWidthScale(1),
          decoration: BoxDecoration(
            borderRadius: theme.style.borderRadius.allSmall,
            color: kSofterGrey,
          ),
          child: Text('Kesemutan di sebelah kiri tubuh, kesulitan bicara',
              style: theme.font.f12),
        ),
        Gap(12.h),
        Text(
          'Pemeriksaan Fisik Awal',
          style: theme.font.f12.semibold,
        ),
        Gap(8.h),
        Column(
          children: List.generate(
              controller.firstPhysicalExaminations.length,
              (index) => Padding(
                  padding: theme.style.padding.bottomMedium,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => controller.selectPhysicalExamination(
                            controller.firstPhysicalExaminations[index]),
                        child: Container(
                          width: theme.style.fullWidth,
                          color: kWhiteColor,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 18.r,
                                width: 18.r,
                                child: Transform.scale(
                                  scale: 1,
                                  child: Checkbox(
                                      value: controller.selectedPhysicalExamination
                                          .contains(controller
                                                  .firstPhysicalExaminations[
                                              index]),
                                      activeColor: kInfoColor,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.r)),
                                      side: BorderSide(
                                          color: kSoftGrey, width: 1.2),
                                      onChanged: (value) => controller
                                          .selectPhysicalExamination(controller
                                              .firstPhysicalExaminations[index])),
                                ),
                              ),
                              Gap(12.w),
                              Text(
                                controller.firstPhysicalExaminations[index],
                                style: theme.font.f14,
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                          visible: controller.selectedPhysicalExamination
                              .contains(
                                  controller.firstPhysicalExaminations[index]),
                          child: Padding(
                              padding: theme.style.padding.topMedium,
                              child: AppForm(
                                controller: controller
                                    .firstPhysicalExaminationsController[index],
                                hintText:
                                    'Masukkan ${controller.firstPhysicalExaminations[index]}',
                              )))
                    ],
                  ))),
        ),
        Gap(12.h),
        Text(
          'Layanan/Terapi Pasien',
          style: theme.font.f12.semibold,
        ),
        Gap(8.h),
        AppForm(
          controller: controller.treatmentGoalsController,
          hintText: 'Masukkan tujuan perawatan',
        ),
        Gap(12.h),
        Text(
          'Pengobatan dan Intervensi selama Kunjungan',
          style: theme.font.f12.semibold,
        ),
        Gap(8.h),
        AppForm(
          controller: controller.interventionalTreatment,
          hintText: 'Masukan pengobatan selama kunjungan',
        ),
        Gap(12.h),
        Text(
          'Layanan/Terapi Pasien',
          style: theme.font.f12.semibold,
        ),
        Gap(8.h),
        Column(
          children: List.generate(
              controller.servicePatients.length,
              (index) => Padding(
                  padding: theme.style.padding.bottomMedium,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => controller.selectservicePatients(
                            controller.servicePatients[index]),
                        child: Container(
                          width: theme.style.fullWidth,
                          color: kWhiteColor,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 18.r,
                                width: 18.r,
                                child: Transform.scale(
                                  scale: 1,
                                  child: Checkbox(
                                      value: controller.selectedservicePatients
                                          .contains(controller
                                              .servicePatients[index]),
                                      activeColor: kInfoColor,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.r)),
                                      side: BorderSide(
                                          color: kSoftGrey, width: 1.2),
                                      onChanged: (value) => controller
                                          .selectservicePatients(controller
                                              .servicePatients[index])),
                                ),
                              ),
                              Gap(12.w),
                              Text(
                                controller.servicePatients[index],
                                style: theme.font.f14,
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                          visible: controller.selectedservicePatients
                              .contains(controller.servicePatients[index]),
                          child: Padding(
                              padding: theme.style.padding.topMedium,
                              child: AppForm(
                                controller:
                                    controller.servicePatientsController[index],
                                hintText:
                                    'Masukkan ${controller.servicePatients[index]}',
                              )))
                    ],
                  ))),
        ),
      ],
    );
  }

  Widget _done(DetailAppointmentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Berikut ini data kesehatan pasien',
          style: theme.font.f12.semibold,
        ),
        Gap(12.h),
        Text(
          'Keluhan Utama',
          style: theme.font.f12.semibold,
        ),
        Gap(8.h),
        Text(
          'Kesemutan di sebelah kiri tubuh, kesulitan bicara',
          style: theme.font.f12,
        ),
        Gap(12.h),
        Text(
          'Pemeriksaan Fisik Awal',
          style: theme.font.f12.semibold,
        ),
        Gap(4.h),
        Text(
          'Pemeriksaan Neurologis',
          style: theme.font.f12,
        ),
        Gap(4.h),
        Text(
          'Terjadi kelemahan otot di sisi tubuh kiri',
          style: theme.font.f12.copyWith(color: kSoftGrey),
        ),
        Gap(4.h),
        Text(
          'Pemeriksaan Umum',
          style: theme.font.f12,
        ),
        Gap(4.h),
        Text(
          'Pupil menunjukkan reaksi lambat terhadap cahaya',
          style: theme.font.f12.copyWith(color: kSoftGrey),
        ),
         Gap(12.h),
        Text(
          'Tujuan Perawatan',
          style: theme.font.f12.semibold,
        ),
        Gap(8.h),
        Text(
          'Mengurangi risiko komplikasi stroke lebih lanjut',
                    style: theme.font.f12.copyWith(color: kSoftGrey),
        ),

        Gap(12.h),
        Text(
          'Layanan/Terapi Pasien',
          style: theme.font.f12.semibold,
        ),
        Gap(8.h),
        Text(
          'Terapi Berjalan',
                    style: theme.font.f12.copyWith(color: kSoftGrey),
        ),
      ],
    );
  }
}
