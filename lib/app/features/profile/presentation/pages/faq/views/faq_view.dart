import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/faq/views/section/app_bar.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarFaq(),
        body: GetBuilder<FaqController>(builder: (controller) {
          return ListView(
            padding: theme.style.padding.allLarge,
            children: [
              ExpansionPanelList(
                  elevation: 0,
                  expandedHeaderPadding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  materialGapSize: 0,
                  expansionCallback: controller.expansionCallback,
                  children: List.generate(
                    controller.isExpandedList.length,
                    (index) => ExpansionPanel(
                      canTapOnHeader: true,
                      backgroundColor: Colors.transparent,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          padding: theme.style.padding.allMedium,
                          width: getWidthScale(1),
                          decoration: BoxDecoration(
                              borderRadius: theme.style.borderRadius.allSmall,
                              color: kWhiteColor,
                              border: Border.all(
                                  color:
                                      controller.isExpandedList[index] == true
                                          ? kPrimaryColor
                                          : kSoftGrey)),
                          child: Text('Question $index', style: theme.font.f16),
                        );
                      },
                      body: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Container(
                          padding: theme.style.padding.allMedium,
                          width: getWidthScale(1),
                          decoration: BoxDecoration(
                              borderRadius: theme.style.borderRadius.allSmall,
                              color: kWhiteColor,
                              border: Border.all(
                                  color:
                                      controller.isExpandedList[index] == true
                                          ? kPrimaryColor
                                          : kSoftGrey)),
                          child: const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo.'),
                        ),
                      ),
                      isExpanded: controller.isExpandedList[index],
                    ),
                  ))
            ],
          );
        }));
  }
}
