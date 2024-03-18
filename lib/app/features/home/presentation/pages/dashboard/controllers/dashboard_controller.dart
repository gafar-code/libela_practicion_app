import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/dialog/confirmation_dialog.dart';
import 'package:libela_practition/app/core/components/snackbar/app_snackbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../schedule/domain/usecase/get_appointments.dart';
import '../../../../../schedule/presentation/utils/model/appointment_params.dart';
import '../../../../../schedule/presentation/utils/model/typedef.dart';

class DashboardController extends GetxController {
  final GetAppointments _getAppointments;
  DashboardController(this._getAppointments);

  Appointment? appointment;
  bool isAppointmentLoading = false;
  int isSectionStarted = 0;

  RefreshController refreshController = RefreshController();

  Future<void> getAppointments() async {
    isAppointmentLoading = true;
    update();
    var param = AppointmentParams(10, '', 'today');
    final response = await _getAppointments(param);
    response.fold((error) => AppSnackbar.show(message: error.message), (data) {
      if (data.isNotEmpty) {
        appointment = data[0];
      }
    });
    isAppointmentLoading = false;
    update();
  }

  void openDialogStartSection() {
    ConfirmationDialog.show(
      title: 'Mulai Sesi Praktek',
      message: 'Yakin ingin mulai sesi praktek sekarang?',
      onTapText: 'mulai',
      onPressed: () {
        Get.back();
        isSectionStarted = 1;
        update();
      },
    );
  }

  void onRefresh() async {
    await Future.delayed(1.seconds, () {
      getAppointments();
    });
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(1.seconds);
    if (isClosed) refreshController.loadComplete();
  }

  @override
  void onInit() {
    getAppointments();
    super.onInit();
  }
}
