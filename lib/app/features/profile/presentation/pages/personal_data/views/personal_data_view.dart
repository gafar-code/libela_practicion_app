// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/personal_data/views/section/list_menu.dart';

import '../controllers/personal_data_controller.dart';
import 'section/app_bar.dart';
import 'section/biodata.dart';
import 'section/profession.dart';
import 'section/service_area.dart';

class PersonalDataView extends GetView<PersonalDataController> {
  const PersonalDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentPage != 0) {
          controller.actionMenu(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          appBar: const AppBarEditProfile(),
          body: GetBuilder<PersonalDataController>(
            builder: (controller) {
              return view(controller.currentPage);
            },
          )),
    );
  }

  Widget view(int index) {
    switch (index) {
      case 1:
        return const BiodataSection();
      case 2:
        return const ProffesionSection();
      case 3:
        return const ServiceAreaSection();
      default:
        return ListMenu(controller: controller);
    }
  }
}
