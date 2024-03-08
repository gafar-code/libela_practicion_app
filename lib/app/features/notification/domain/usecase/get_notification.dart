import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/notification/domain/entities/notification.dart';
import 'package:libela_practition/app/features/notification/presentation/utils/models/notification_params.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/notification_repositories.dart';

class GetNotifications
    extends UseCase<List<NotificationEntity>, NotificationParams> {
  final NotificationRepositories _notificationRepositories;

  GetNotifications(this._notificationRepositories);

  @override
  Future<Either<RemoteFailure, List<NotificationEntity>>> call(
      NotificationParams param) async {
    return _notificationRepositories.getNotification(param);
  }
}
