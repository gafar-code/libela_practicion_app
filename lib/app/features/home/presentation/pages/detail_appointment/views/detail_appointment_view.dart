import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/home/presentation/pages/detail_appointment/views/section/information_order.dart';
import 'package:libela_practition/app/features/home/presentation/pages/detail_appointment/views/section/information_service.dart';
import 'package:libela_practition/app/features/home/presentation/pages/detail_appointment/views/section/information_session.dart';
import 'package:libela_practition/app/features/home/presentation/pages/detail_appointment/views/section/information_visit.dart';

import '../controllers/detail_appointment_controller.dart';
import 'section/app_bar.dart';
import 'section/information_action.dart';
import 'section/information_pattient.dart';

class DetailAppointmentView extends GetView<DetailAppointmentController> {
  const DetailAppointmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarDetailAppointment(),
        body: ListView(
          padding: theme.style.padding.allLarge,
          children: const [
            InformationSession(),
            InformationOrder(),
            InformationPatient(),
            InformationVisit(),
            InformationService(),
            InformationAction()
          ],
        ));
  }
}
