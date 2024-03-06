import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchedulePageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndexTab = 0;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      currentIndexTab = tabController.index;
      update();
    });
    super.onInit();
  }
}
