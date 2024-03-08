import 'package:libela_practition/app/features/notification/data/models/notification.dart';

import '../../presentation/utils/models/notification_params.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications(NotificationParams params);
}
