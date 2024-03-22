import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/core/utils/extension/convert_local.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../domain/entities/transaction_history.dart';

class ItemHistory extends StatelessWidget {
  const ItemHistory({super.key, required this.data});

  final TransactionHistoryEntity data;

  @override
  Widget build(BuildContext context) {
    return CardShadow(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        badgeType(data.transactionStatus ?? ''),
        Gap(12.w),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(data.item ?? '', style: theme.font.f12.medium),
            Gap(4.h),
            Text("${data.createdAt}".convertToLocaleDay,
                style: theme.font.f12.copyWith(color: kSoftGrey)),
          ]),
        )
      ],
    ));
  }

  Widget badgeType(String status) {
    switch (status) {
      case 'success':
        return badgeStatus(kSuccessColor, done);
      case 'failed':
        return badgeStatus(kSecondaryAccentColor, cancel);
      case 'waiting_approval':
        return badgeStatus(kWarningColor, waitingBadge);

      default:
        return SizedBox.shrink();
    }
  }

  Widget badgeStatus(Color color, String assets) {
    return CircleAvatar(
      radius: 14.r,
      backgroundColor: color.withOpacity(0.2),
      child: LocalAssets.svg(assets, height: 16.r),
    );
  }
}
