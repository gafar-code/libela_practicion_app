import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../domain/usecase/get_pending_appointment.dart';
import '../../../utils/models/pending_appointment_params.dart';
import '../../../utils/models/typedef.dart';

class IncomingRequestController extends GetxController {
  final GetPendingAppointments _getPendingAppointments;
  IncomingRequestController(this._getPendingAppointments);

  late PagingController<int, PendingAppointments> pagingController;
  RefreshController refreshController = RefreshController();
  int _limit = 5;
  var waitingApprove = 0.obs;

  Future<void> getPendingAppointment(int pageKey) async {
    try {
      _limit += 5;
      var param = PendingAppointmentParams(_limit);
      final response = await _getPendingAppointments(param);
      waitingApprove(0);
      response.fold((error) => null, (data) {
        final isLastPage = data.length < _limit;
        waitingApprove(data.length);

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

  void onRefresh() async {
    await Future.delayed(1.seconds, () {
      _limit = 5;
      pagingController.itemList?.clear();
      pagingController.refresh();
    });
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(1.seconds);
    if (isClosed) refreshController.loadComplete();
  }

  @override
  void onInit() {
    pagingController = PagingController(firstPageKey: 1);
    pagingController.addPageRequestListener((pageKey) {
      getPendingAppointment(pageKey);
    });
    super.onInit();
  }
}
