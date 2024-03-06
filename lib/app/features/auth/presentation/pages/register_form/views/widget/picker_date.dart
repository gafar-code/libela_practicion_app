import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../controllers/biodata_controller.dart';

class PickerDate extends StatelessWidget {
  const PickerDate({super.key, required this.controller});
  final RegisterBiodataController controller;

  @override
  Widget build(BuildContext context) {
    final config = CalendarDatePicker2Config(
        selectedDayHighlightColor: kPrimaryAccentColor,
        weekdayLabels: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
        weekdayLabelTextStyle: theme.font.f14.copyWith(color: kSoftGrey),
        centerAlignModePicker: true,
        firstDayOfWeek: 1,
        controlsHeight: 50,
        controlsTextStyle: theme.font.f14.medium,
        dayTextStyle: theme.font.f14.medium,
        calendarType: CalendarDatePicker2Type.single,
        dayBorderRadius: BorderRadius.circular(24.r),
        customModePickerIcon: const SizedBox());

    return AppBottomSheet.witoutFooter(
        child: GetBuilder<RegisterBiodataController>(builder: (controller) {
      return CalendarDatePicker2(
        config: config,
        value: controller.datePicker,
        onValueChanged: (values) => controller.pickDate(values),
      );
    }));
  }
}
