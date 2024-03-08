import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

import '../../../../domain/usecase/get_detail_appointment.dart';
import '../../../../../home/presentation/utils/models/typedef.dart';

enum DetailAppointmentStatus {
  willStart,
  newPatient,
  rejected,
  accepted,
  sessionStart,
  done
}

enum RejectReason { fillQueue, other }

class DetailAppointmentController extends GetxController {
  final GetDetailAppointments _getDetailAppointments;
  DetailAppointmentController(this._getDetailAppointments);
  DetailAppointmentStatus appointmentStatus =
      DetailAppointmentStatus.newPatient;
  List<TextEditingController> firstPhysicalExaminationsController = [];
  List<TextEditingController> servicePatientsController = [];
  TextEditingController treatmentGoalsController = TextEditingController();
  TextEditingController interventionalTreatment = TextEditingController();

  DetailAppointment? detailAppointment;
  var loadingPages = false.obs;

  List<RejectReason> rejects = [RejectReason.fillQueue, RejectReason.other];
  List<String> firstPhysicalExaminations = [
    "Pemeriksaan Neurologis",
    "Pemeriksaan Umum",
    "Pemeriksaan Keseimbangan & Koordinasi",
    "Fungsi Motorik"
  ];

  List<String> servicePatients = [
    "Terapi Gerak Pasif",
    "Terapi Gerak Aktif",
    "Terapi Berjalan",
    "Terapi Gangguan Bicara (Disfagia)",
    "Biofeedback"
  ];

  RejectReason? rejectReason;
  List<String> selectedPhysicalExamination = [];
  List<String> selectedservicePatients = [];

  bool isExpandedOrder = false;
  bool isExpandedPatient = false;
  bool isExpandedService = false;
  bool isExpandedVisit = false;
  bool isExpandedAction = false;

  void rejectReasonSelected(RejectReason reason) {
    rejectReason = reason;
    update();
  }

  void expandOrder() {
    isExpandedOrder = !isExpandedOrder;
    update();
  }

  void expandPatient() {
    isExpandedPatient = !isExpandedPatient;
    update();
  }

  void expandService() {
    isExpandedService = !isExpandedService;
    update();
  }

  void expandVisit() {
    isExpandedVisit = !isExpandedVisit;
    update();
  }

  void expandAction() {
    isExpandedAction = !isExpandedAction;
    update();
  }

  void selectPhysicalExamination(String value) {
    if (selectedPhysicalExamination.contains(value)) {
      selectedPhysicalExamination.remove(value);
    } else {
      selectedPhysicalExamination.add(value);
    }
    update();
  }

  void selectservicePatients(String value) {
    if (selectedservicePatients.contains(value)) {
      selectedservicePatients.remove(value);
    } else {
      selectedservicePatients.add(value);
    }
    update();
  }

  Future<void> getDetailAppointment(String appointmentCode) async {
    loadingPages(true);
    final result = await _getDetailAppointments(appointmentCode);
    result.fold((l) {
      print(l.message);
    }, (data) {
      detailAppointment = data;
      setStatus(data.status ?? '');
      update();
    });
    loadingPages(false);
  }

  void setStatus(String status) {
    if (status == 'panding') {
      appointmentStatus = DetailAppointmentStatus.newPatient;
    }
  }

  void endSession() {
    Get.toNamed(Routes.FORM_ACTION);
  }

  @override
  void onInit() {
    getDetailAppointment(Get.arguments);
    firstPhysicalExaminationsController = List.generate(
        firstPhysicalExaminations.length, (index) => TextEditingController());

    servicePatientsController = List.generate(
        servicePatients.length, (index) => TextEditingController());
    super.onInit();
  }
}
