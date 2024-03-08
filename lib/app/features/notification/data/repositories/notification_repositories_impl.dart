import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/notification/domain/entities/notification.dart';
import '../../../../core/error/error_imports.dart';
import '../../domain/repositories/notification_repositories.dart';
import '../../presentation/utils/models/notification_params.dart';
import '../data_sources/notification_remote_data_source.dart';

class NotificationRepositoriesImpl implements NotificationRepositories {
  final NotificationRemoteDataSource _notificationRemoteDataSource;
  NotificationRepositoriesImpl(this._notificationRemoteDataSource);

  @override
  Future<Either<RemoteFailure, List<NotificationEntity>>> getNotification(
      NotificationParams params) async {
    try {
      final data = await _notificationRemoteDataSource.getNotifications(params);
      final notifications =
          data.map((e) => NotificationEntity.fromModel(e)).toList();
      return Right(notifications);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }
}
