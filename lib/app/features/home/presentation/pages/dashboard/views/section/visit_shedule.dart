import 'package:flutter/cupertino.dart';
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
import 'package:libela_practition/app/features/home/presentation/pages/dashboard/controllers/dashboard_controller.dart';

class VisitShedule extends StatelessWidget {
  const VisitShedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Jadwal Kunjungan',
            style: theme.font.f14.medium,
          ),
          const AppTextButton(
            text: 'Lihat Jadwal',
          )
        ]),
        Gap(12.h),
        const Visibility(visible: false, child: ScheduleNotAvailable()),
        const Visibility(visible: true, child: ScheduleAvailable()),
        Gap(12.h),
        // Row(
        //   children: [
        //     Expanded(
        //         child: GestureDetector(
        //       onTap: () {
        //         Get.toNamed(Routes.INCOMING_REQUEST);
        //       },
        //       child: Container(
        //         padding: theme.style.padding.allMedium,
        //         decoration: BoxDecoration(
        //             borderRadius: theme.style.borderRadius.allSmall,
        //             color: kSofterGrey),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               height: 30.r,
        //               width: 30.r,
        //               padding: theme.style.padding.allSmall,
        //               decoration: BoxDecoration(
        //                   color: kInfoColorAccent,
        //                   borderRadius: theme.style.borderRadius.allSmall),
        //               child: LocalAssets.svg(date),
        //             ),
        //             Gap(8.h),
        //             Row(
        //               children: [
        //                 Text('Permintaan Masuk', style: theme.font.f12),
        //                 Gap(4.w),
        //                 CircleAvatar(
        //                   radius: 8.r,
        //                   backgroundColor: kSuccessColor,
        //                   child: Text(
        //                     '0',
        //                     style: theme.font.f12.white.semibold,
        //                   ),
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     )),
        //     Gap(12.w),
        //     Expanded(
        //         child: GestureDetector(
        //       onTap: () {
        //         Get.toNamed(Routes.VISIT_IS_OVER);
        //       },
        //       child: Container(
        //         padding: theme.style.padding.allMedium,
        //         decoration: BoxDecoration(
        //             borderRadius: theme.style.borderRadius.allSmall,
        //             color: kSofterGrey),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               height: 30.r,
        //               width: 30.r,
        //               padding: theme.style.padding.allSmall,
        //               decoration: BoxDecoration(
        //                   color: kInfoColorAccent,
        //                   borderRadius: theme.style.borderRadius.allSmall),
        //               child: LocalAssets.svg(akar),
        //             ),
        //             Gap(8.h),
        //             Row(
        //               children: [
        //                 Text('Kunjungan Selesai', style: theme.font.f12),
        //                 Gap(4.w),
        //                 CircleAvatar(
        //                   radius: 8.r,
        //                   backgroundColor: kSuccessColor,
        //                   child: Text(
        //                     '0',
        //                     style: theme.font.f12.white.semibold,
        //                   ),
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ))
        //   ],
        // ),
        // Gap(16.h)
      ],
    );
  }
}

class ScheduleNotAvailable extends StatelessWidget {
  const ScheduleNotAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.style.padding.allLarge,
      width: theme.style.fullWidth,
      height: 130.h,
      decoration: BoxDecoration(
          color: kSofterGrey, borderRadius: theme.style.borderRadius.allSmall),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LocalAssets.svg(textDate),
          Gap(12.h),
          Text(
            'Oops! Jadwal belum tersedia',
            style: theme.font.f12,
          )
        ],
      ),
    );
  }
}

class ScheduleAvailable extends StatelessWidget {
  const ScheduleAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      if (controller.isAppointmentLoading) {
        return SizedBox(
            height: 100.h,
            child: Center(child: CupertinoActivityIndicator(color: kSoftGrey)));
      } else {
        return Visibility(
          visible: controller.appointment != null,
          child: Container(
            padding: theme.style.padding.allMedium,
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allSmall,
                color: kPrimaryAccentColor2),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pasien', style: theme.font.f12.white),
                        Text(controller.appointment?.patient?.name ?? '',
                            style: theme.font.f12.white.semibold),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => controller.openDialogStartSection(),
                      child: Container(
                        height: 32.h,
                        padding: theme.style.padding.horizontalMedium,
                        decoration: BoxDecoration(
                            borderRadius: theme.style.borderRadius.allSmall,
                            color: kWhiteColor),
                        child: Center(
                          child: Text(
                            controller.isSectionStarted == 0
                                ? 'Mulai Sesi'
                                : 'Akhiri Sesi',
                            style: theme.font.f12
                                .copyWith(
                                    color: controller.isSectionStarted == 0
                                        ? kPrimaryColor
                                        : kSecondaryColor)
                                .medium,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Gap(12.h),
                Container(
                  padding: theme.style.padding.allMedium,
                  decoration: BoxDecoration(
                      color: kPrimaryAccentColor,
                      borderRadius: theme.style.borderRadius.allSmall),
                  child: Row(
                    children: [
                      LocalAssets.svg(dateSchadule),
                      Gap(8.w),
                      Text(
                        controller.appointment?.startAt?.convertToLocaleDate ??
                            '',
                        style: theme.font.f12.white,
                      ),
                      const Spacer(),
                      Container(
                        height: 20.h,
                        width: 1.w,
                        color: kBorder,
                      ),
                      const Spacer(),
                      LocalAssets.svg(time),
                      Gap(8.w),
                      Text(
                        '${controller.appointment?.startAt?.convertToLocaleTime ?? ''} - ${controller.appointment?.endAt?.convertToLocaleTime ?? ''}',
                        style: theme.font.f12.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
