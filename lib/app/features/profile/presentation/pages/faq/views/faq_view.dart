import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/loading/load_pages.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/faq/views/section/app_bar.dart';

import '../../../../../../core/components/components_lib.dart';
import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return LoadingPages();
      } else {
        return Scaffold(
            appBar: const AppBarFaq(),
            body: GetBuilder<FaqController>(builder: (controller) {
              return Padding(
                padding: theme.style.padding.allLarge,
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          controller.faqs.length,
                          (index) => CustomExpansion(
                                title: controller.faqs[index].title,
                                isExpanded: controller.isExpandedList[index],
                                onTap: () =>
                                    controller.expansionCallback(index),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.faqs[index].description ?? '',
                                      style: theme.font.f14,
                                    )
                                  ],
                                ),
                              ))),
                ),
              );
            }));
      }
    });
  }
}
