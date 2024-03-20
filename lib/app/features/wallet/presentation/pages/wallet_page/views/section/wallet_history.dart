import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
// import 'package:libela_practition/app/features/wallet/domain/entities/transaction_line.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/wallet_page/views/widget/item_history.dart';

import '../../../../../../../config/theme/theme.dart';
// import '../../../../../../../core/components/infiniti_page/infiniti_page.dart';
import '../../controllers/wallet_page_controller.dart';

class WalletHistorySection extends StatelessWidget {
  const WalletHistorySection({super.key, required this.controller});

  final WalletPageController controller;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: theme.style.padding.horizontalLarge,
      sliver: SliverList.separated(
          itemCount: controller.listDummy.length,
          itemBuilder: (_, index) {
            return ItemHistory(data: controller.listDummy[index]);
          },
          separatorBuilder: (_, i) => Gap(12.h)),
      // sliver: PagedSliverList.separated(
      //     pagingController: controller.pagingController,
      //     builderDelegate: PagedChildBuilderDelegate<TransactionLineEntity>(
      //       itemBuilder: (context, item, index) {
      //         return ItemHistory(data: item);
      //       },
      //       newPageProgressIndicatorBuilder: InfinitiPage.progress,
      //       firstPageProgressIndicatorBuilder: InfinitiPage.progress,
      //       noItemsFoundIndicatorBuilder: (_) =>
      //           InfinitiPage.empty(_, 'Riwayat'),
      //       firstPageErrorIndicatorBuilder: InfinitiPage.error,
      //     ),
      //     separatorBuilder: (_, i) => Gap(12.h)),
    );
  }
}
