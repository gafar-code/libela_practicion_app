import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/core/utils/extension/convert_local.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/detail_appointment/controllers/detail_appointment_controller.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/detail_appointment/views/widget/reject_confirmation.dart';

class InformationSession extends StatelessWidget {
  const InformationSession({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailAppointmentController>(builder: (controller) {
      return view(controller);
    });
  }

  Widget view(DetailAppointmentController controller) {
    switch (controller.appointmentStatus) {
      case DetailAppointmentStatus.willStart:
        return _willStart(controller);
      case DetailAppointmentStatus.newPatient:
        return _newPatient(controller);
      case DetailAppointmentStatus.rejected:
        return _rejected(controller);
      case DetailAppointmentStatus.accepted:
        return _accepted(controller);
      case DetailAppointmentStatus.sessionStart:
        return _sessionStart(controller);
      default:
        return _done(controller);
    }
  }

  Widget _willStart(DetailAppointmentController controller) {
    return Padding(
      padding: theme.style.padding.bottomLarge,
      child: Row(
        children: [
          LocalAssets.svg(akar),
          Gap(12.w),
          Expanded(
              flex: 6,
              child: Text(
                'Sesi Kunjungan akan dimulai pada 09:00 WIB',
                style: theme.font.f14.medium,
              )),
          Gap(6.w),
          Expanded(
              flex: 4,
              child: GestureDetector(
                child: Container(
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: theme.style.borderRadius.allSmall,
                      color: kWhiteColor,
                      border: Border.all(color: kPrimaryColor)),
                  child: Center(
                    child: Text(
                      'Mulai Sesi',
                      style:
                          theme.font.f14.copyWith(color: kPrimaryColor).medium,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _newPatient(DetailAppointmentController controller) {
    return Padding(
      padding: theme.style.padding.bottomLarge,
      child: Column(
        children: [
          Container(
            width: getWidthScale(1),
            padding: theme.style.padding.allMedium,
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allSmall,
                color: kSofterGrey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AppointmentID: ',
                  style: theme.font.f12,
                ),
                Text(
                  '${Get.arguments}',
                  style: theme.font.f12.semibold,
                ),
              ],
            ),
          ),
          Gap(12.h),
          Container(
            width: getWidthScale(1),
            padding: theme.style.padding.allLarge,
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allSmall,
                color: kSofterGrey),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                radius: 18.r,
                backgroundColor: kPrimaryAccentColor2,
                child:
                    LocalAssets.svg(schadule, height: 18.h, color: kWhiteColor),
              ),
              Gap(12.w),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Permintaan kunjungan untuk tanggal:',
                        style: theme.font.f14,
                      ),
                      Gap(3.h),
                      Text(
                        '${controller.detailAppointment?.startAt?.convertToLocaleDay} ~ ${controller.detailAppointment?.startAt?.convertToLocaleTime} - ${controller.detailAppointment?.endAt?.convertToLocaleTime}',
                        style: theme.font.f14.semibold,
                      ),
                      Gap(16.h),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryAccentButton(
                              text: 'Tolak',
                              onPressed: () => ConfirmationReject.show(),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: PrimaryButton(
                              text: 'Terima',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )
                    ]),
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget _rejected(DetailAppointmentController controller) {
    return Padding(
        padding: theme.style.padding.bottomLarge,
        child: Column(
          children: [
            Container(
              width: getWidthScale(1),
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allSmall,
                  color: kSofterGrey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AppointmentID:',
                    style: theme.font.f12,
                  ),
                  Text(
                    'A1234567890',
                    style: theme.font.f12.semibold,
                  ),
                ],
              ),
            ),
            Gap(12.h),
            Container(
              width: getWidthScale(1),
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allMedium,
                  color: kSecondaryAccentColor2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundColor: kSecondaryColor,
                    child: const Icon(
                      Icons.close_rounded,
                      color: kWhiteColor,
                    ),
                  ),
                  Gap(12.w),
                  Expanded(
                    child: Text(
                      'Permintaan untuk tanggal: Senin, 28 Maret 2024 berhasil ditolak',
                      style: theme.font.f14.medium,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _accepted(DetailAppointmentController controller) {
    return Padding(
        padding: theme.style.padding.bottomLarge,
        child: Column(
          children: [
            Container(
              width: getWidthScale(1),
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allSmall,
                  color: kSofterGrey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AppointmentID:',
                    style: theme.font.f12,
                  ),
                  Text(
                    'A1234567890',
                    style: theme.font.f12.semibold,
                  ),
                ],
              ),
            ),
            Gap(12.h),
            Container(
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allMedium,
                  color: kSuccessAccentColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 18.r,
                      backgroundColor: kSuccessColor,
                      child: LocalAssets.svg(akar, color: kWhiteColor)),
                  Gap(12.w),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'Kunjungan untuk tanggal : ',
                                  style: theme.font.f14,
                                  children: [
                                TextSpan(
                                    text:
                                        'Senin, 28 Maret 2024 ~ 09.00 - 10.00',
                                    style: theme.font.f14.semibold)
                              ])),
                          Gap(16.h),
                          const PrimaryButton(
                            text: 'Mulai Sesi',
                            // onPressed: () {},
                          )
                        ]),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _sessionStart(DetailAppointmentController controller) {
    return Padding(
        padding: theme.style.padding.bottomLarge,
        child: Column(
          children: [
            Container(
              width: getWidthScale(1),
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allSmall,
                  color: kSofterGrey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AppointmentID:',
                    style: theme.font.f12,
                  ),
                  Text(
                    'A1234567890',
                    style: theme.font.f12.semibold,
                  ),
                ],
              ),
            ),
            Gap(12.h),
            Row(
              children: [
                LocalAssets.svg(akar),
                Gap(12.w),
                Expanded(
                    flex: 6,
                    child: Text(
                      'Sesi Kunjungan sedang berlangsung',
                      style: theme.font.f14.medium,
                    )),
                Gap(6.w),
                Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () => controller.endSession(),
                      child: Container(
                        height: 44.h,
                        decoration: BoxDecoration(
                            borderRadius: theme.style.borderRadius.allSmall,
                            color: kWhiteColor,
                            border: Border.all(color: kSecondaryColor)),
                        child: Center(
                          child: Text(
                            'Akhiri Sesi',
                            style: theme.font.f14
                                .copyWith(color: kSecondaryColor)
                                .medium,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ));
  }

  Widget _done(DetailAppointmentController controller) {
    return Padding(
        padding: theme.style.padding.bottomLarge,
        child: Column(
          children: [
            Container(
              width: getWidthScale(1),
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allSmall,
                  color: kSofterGrey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AppointmentID:',
                    style: theme.font.f12,
                  ),
                  Text(
                    'A1234567890',
                    style: theme.font.f12.semibold,
                  ),
                ],
              ),
            ),
            Gap(12.h),
            Container(
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allMedium,
                  color: kSuccessAccentColor),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12.r,
                    backgroundColor: kSuccessColor,
                    child: Icon(
                      Icons.check,
                      color: kWhiteColor,
                      size: 18.r,
                    ),
                  ),
                  Gap(12.w),
                  Text(
                    'Sesi Kunjungan telah selesai',
                    style: theme.font.f14.medium,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
