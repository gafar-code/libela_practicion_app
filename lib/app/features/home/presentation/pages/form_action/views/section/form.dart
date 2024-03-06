import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/home/presentation/pages/form_action/controllers/form_action_controller.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormActionController>(builder: (controller) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Pengobatan dan Intervensi selama Kunjungan',
            style: theme.font.f14),
        Gap(8.h),
        AppForm(
          textArea: true,
          controller: controller.interventionalTreatmentController,
          hintText: 'Isi Pengobatan dan Intervensi selama Kunjungan',
        ),
        Gap(12.h),
        Text('Rencana Perawatan Selanjutnya', style: theme.font.f14),
        Gap(8.h),
        AppForm(
          textArea: true,
          controller: controller.treatmentPlanController,
          hintText: 'Isi Rencana Perawatan Selanjutnya',
        ),
        Gap(12.h),
        Text('Catatan Tambahan', style: theme.font.f14),
        Gap(8.h),
        AppForm(
          textArea: true,
          controller: controller.postscriptController,
          hintText: 'Isi Catatan Tambahan',
        )
      ]);
    });
  }
}
