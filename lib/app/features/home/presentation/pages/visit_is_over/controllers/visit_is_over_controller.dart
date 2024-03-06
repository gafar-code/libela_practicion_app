import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

class VisitIsOverController extends GetxController {
  TextEditingController searchController = TextEditingController();

  void toDetailAppointment() {
    Get.toNamed(Routes.DETAIL_APPOINTMENT);
  }
}
