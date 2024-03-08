import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:libela_practition/app/features/notification/domain/usecase/get_notification.dart';
import 'package:libela_practition/app/features/notification/presentation/utils/models/notification_params.dart';
import 'package:libela_practition/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../utils/models/typedef.dart';

class NotificationPageController extends GetxController {
  final GetNotifications _getNotifications;

  NotificationPageController(this._getNotifications);

  late PagingController<int, NotificationData> pagingController;
  RefreshController refreshController = RefreshController();
  int _limit = 5;

  Future<void> getNotification(int pageKey) async {
    try {
      _limit += 5;
      var param = NotificationParams(_limit);
      final response = await _getNotifications(param);
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

  void toDetailAppointment(
      {required String type, required String appointmentId}) {
    if (type == 'new-appointment') {
      Get.toNamed(Routes.DETAIL_APPOINTMENT, arguments: appointmentId);
    }
  }

  @override
  void onInit() {
    pagingController = PagingController(firstPageKey: 1);
    pagingController.addPageRequestListener((pageKey) {
      getNotification(pageKey);
    });
    super.onInit();
  }
}
