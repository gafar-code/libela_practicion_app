import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/notification/domain/entities/notification.dart';

import '../../../../core/error/error_imports.dart';
import '../../presentation/utils/models/notification_params.dart';

abstract class NotificationRepositories {
  Future<Either<RemoteFailure, List<NotificationEntity>>> getNotification(
      NotificationParams params);
}
