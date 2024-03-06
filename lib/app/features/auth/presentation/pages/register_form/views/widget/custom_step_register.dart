import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';

import '../../../../../../../config/theme/colors.dart';

class CustomStepperRegister extends StatelessWidget {
  final int currentStep;

  const CustomStepperRegister({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    List<String> icons = [profile, message, doctor, location, document];
    return SizedBox(
      height: 40.h,
      width: getWidthScale(1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          bool isActive = index <= currentStep;
          return Row(
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isActive ? Colors.transparent : kBorder,
                    width: 1.5,
                  ),
                  color: isActive ? kPrimaryColor : Colors.transparent,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icons[index],
                    colorFilter: ColorFilter.mode(
                      isActive ? kWhiteColor : kSoftGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              if (index < 4)
                Container(
                  width: (getWidthScale(1.2) - (30 * 5).r) / 5.1,
                  height: 1.4,
                  color: isActive ? kPrimaryColor : kBorder,
                ),
            ],
          );
        }),
      ),
    );
  }
}
