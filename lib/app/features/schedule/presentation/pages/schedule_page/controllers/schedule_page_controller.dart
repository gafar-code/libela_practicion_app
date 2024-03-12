import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:libela_practition/app/core/components/dialog/confirmation_dialog.dart';
import 'package:libela_practition/app/core/components/snackbar/app_snackbar.dart';
import 'package:libela_practition/app/features/schedule/domain/usecase/set_reminder.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/model/appointment_params.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/model/enum.dart';
import 'package:libela_practition/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../domain/usecase/confirm_appointment.dart';
import '../../../../domain/usecase/get_appointments.dart';
import '../../../utils/model/set_reminder_body.dart';
import '../../../utils/model/typedef.dart';

class SchedulePageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GetAppointments _getAppointments;
  final SetReminder _setReminder;
  final ConfirmAppointment _confirmAppointment;

  SchedulePageController(
      this._getAppointments, this._setReminder, this._confirmAppointment);

  late PagingController<int, Appointment> pagingController;
  int _limit = 5;
  List<RefreshController> refreshController = [];

  late TabController tabController;
  var currentIndexTab = 0.obs;
  var loadingOnChangeTab = false.obs;

  String? selectedStatusAppointment;
  List<ScheduleTab> statusTabs = ScheduleTab.values;

  Future<void> getAppointments(int pageKey) async {
    try {
      _limit += 5;
      var param = AppointmentParams(_limit, selectedStatusAppointment ?? '');
      final response = await _getAppointments(param);
      response.fold((error) => null, (data) {
        final isLastPage = data.length < _limit;

        if (isLastPage) {
          pagingController.appendLastPage(data);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(data, nextPageKey);
        }
      });
    } catch (error) {
      pagingController.error = error;
    }
  }

  setAppointmentByStatus(int? index) {
    selectedStatusAppointment = statusTabs[index ?? 0].filter;
    currentIndexTab.value = index ?? 0;
    pagingController.itemList?.clear();
    getAppointments(1);
    Future.delayed(1.seconds, () {
      loadingOnChangeTab(false);
    });
  }

  Future<void> setReminder(
      {required String appointmentCode, int? activateReminder}) async {
    final body =
        SetReminderBody(activateReminder: activateReminder == 0 ? 1 : 0);
    final response = await _setReminder(appointmentCode, body);
    response.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      for (int i = 0; i < pagingController.itemList!.length; i++) {
        if (pagingController.itemList![i].appointmentCode == appointmentCode) {
          pagingController.itemList![i] = pagingController.itemList![i]
              .copyWith(setReminder: data.activateReminder);
        }
      }
      update();
      if (data.activateReminder == 1) {
        AppSnackbar.show(
            message: 'Kamu akan diingatkan 1 jam sebelum kunjungan',
            type: SnackType.dark);
      }
    });
  }

  void toDetailAppointment(String appointmentCode) {
    Get.toNamed(Routes.DETAIL_APPOINTMENT, arguments: appointmentCode);
  }

  void openDialogConfirmationAppointment(String appointmentCode) {
    ConfirmationDialog.show(
        title: 'Konfirmasi Kedatangan',
        message:
            'Yakin ingin mengkonfirmasi kedatangan ke tempat tinggal pasien?',
        onTapText: 'konfirmasi',
        isCenterMessage: true,
        onPressed: () {
          Get.back();
          confirmAppointment(appointmentCode);
        });
  }

  Future<void> confirmAppointment(String appointmentCode) async {
    final response = await _confirmAppointment(appointmentCode);
    response.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      for (int i = 0; i < pagingController.itemList!.length; i++) {
        if (pagingController.itemList![i].appointmentCode == appointmentCode) {
          pagingController.itemList![i] =
              pagingController.itemList![i].copyWith(status: 'assinged');
        }
      }
      update();
    });
  }

  // Refresh

  void onRefresh() async {
    await Future.delayed(1.seconds, () {
      _limit = 5;
      pagingController.itemList?.clear();
      pagingController.refresh();
    });
    refreshController[currentIndexTab.value].refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(1.seconds);
    if (isClosed) refreshController[currentIndexTab.value].loadComplete();
  }

  @override
  void onInit() {
    refreshController =
        List.generate(5, (index) => RefreshController(initialRefresh: false));
    pagingController = PagingController(firstPageKey: 1);
    pagingController.addPageRequestListener((page) {
      log("Page : $page");
      getAppointments(page);
    });
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      currentIndexTab.value = tabController.index;
      loadingOnChangeTab(true);
      if (!tabController.indexIsChanging) {
        setAppointmentByStatus(tabController.index);
      }
    });
    super.onInit();
  }
}
