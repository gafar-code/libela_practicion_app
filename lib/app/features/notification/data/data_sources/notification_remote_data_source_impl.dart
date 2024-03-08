import '../../../../core/network/endpoints.dart';
import '../../../../core/network/remote_data_source_impl.dart';
import '../../../../core/network/request_remote.dart';
import '../../presentation/utils/models/notification_params.dart';
import '../models/notification.dart';
import 'notification_remote_data_source.dart';

class NotificationRemoteDataSourcesImpl extends RemoteDataSourceImpl
    implements NotificationRemoteDataSource {
  NotificationRemoteDataSourcesImpl(super.client);

  @override
  Future<List<NotificationModel>> getNotifications(
      NotificationParams params) async {
    final response = await hitAPI(() => get(Endpoints.notifications, params));
    return List.from(response['data'])
        .map((e) => NotificationModel.fromJson(e))
        .toList();
  }
}
