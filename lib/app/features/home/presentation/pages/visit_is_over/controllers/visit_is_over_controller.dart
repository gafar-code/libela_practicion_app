import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:libela_practition/app/features/schedule/domain/usecase/get_appointments.dart';
import 'package:libela_practition/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../schedule/presentation/utils/model/appointment_params.dart';
import '../../../../../schedule/presentation/utils/model/typedef.dart';

class VisitIsOverController extends GetxController {
  final GetAppointments _getAppointments;

  VisitIsOverController(this._getAppointments);
  TextEditingController searchController = TextEditingController();

  late PagingController<int, Appointment> pagingController;
  int _limit = 5;
  RefreshController refreshController = RefreshController();

  String? searchName;
  bool searchActived = false;

  List<dynamic> filters = [
    {'filter': 'Hari Ini', 'value': 'today'},
    {'filter': 'Kemaren', 'value': 'yesterday'},
    {'filter': 'Terlama', 'value': 'pastdays'},
  ];

  String? selectedFilter;

  Future<void> getAppointments(int pageKey) async {
    try {
      _limit += 5;
      var param =
          AppointmentParams(_limit, 'finish', selectedFilter, searchName);
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

  void filterByDate(String value) {
    selectedFilter = value;
    update();
    pagingController.refresh();
  }

  void searchPatient(String value) {
    searchName = value;
    pagingController.refresh();
  }

  void onRefresh() async {
    await Future.delayed(1.seconds, () {
      _limit = 5;
      selectedFilter = null;
      pagingController.itemList?.clear();
      pagingController.refresh();
    });
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(1.seconds);
    if (isClosed) refreshController.loadComplete();
  }

  void toDetailAppointment(String? appointmentCode) {
    Get.toNamed(Routes.DETAIL_APPOINTMENT, arguments: appointmentCode);
  }

  @override
  void onInit() {
    pagingController = PagingController(firstPageKey: 1);
    pagingController.addPageRequestListener((page) {
      getAppointments(page);
    });
    super.onInit();
  }
}
