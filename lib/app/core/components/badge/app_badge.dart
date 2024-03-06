import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';

import '../../../config/theme/colors.dart';

enum AppBadgeType { info, success, error, wrning }

class AppBadge extends StatelessWidget {
  const AppBadge(
      {super.key, this.type = AppBadgeType.info, required this.text});

  final AppBadgeType type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.style.padding.allSmall,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r), color: getColor),
      child: Text(text, style: theme.font.f12.copyWith(color: getColorText)),
    );
  }

  Color get getColor {
    switch (type) {
      case AppBadgeType.info:
        return kInfoColorAccent;
      case AppBadgeType.success:
        return kSuccessAccentColor;
      case AppBadgeType.error:
        return kSecondaryAccentColor2;
      case AppBadgeType.wrning:
        return kWarningColorAccent;
    }
  }

  Color get getColorText {
    switch (type) {
      case AppBadgeType.info:
        return kInfoColor;
      case AppBadgeType.success:
        return kSuccessColor;
      case AppBadgeType.error:
        return kErrorColor;
      case AppBadgeType.wrning:
        return kWarningColor;
    }
  }
}
