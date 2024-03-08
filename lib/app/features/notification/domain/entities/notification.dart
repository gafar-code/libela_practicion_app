import 'package:equatable/equatable.dart';

import '../../data/models/notification.dart';

class NotificationEntity extends Equatable {
  final String? id;
  final String? notificationType;
  final String? notificationData;
  final String? referenceId;
  final String? createdAt;
  final String? updatedAt;
  final NotificationDataEntity? notification;

  NotificationEntity(
      {this.id,
      this.notificationType,
      this.notificationData,
      this.referenceId,
      this.createdAt,
      this.updatedAt,
      this.notification});

  factory NotificationEntity.fromModel(NotificationModel model) {
    return NotificationEntity(
        id: model.id,
        notificationType: model.notificationType,
        notificationData: model.notificationData,
        referenceId: model.referenceId,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        notification: model.notification != null
            ? NotificationDataEntity.fromModel(model.notification!)
            : null);
  }

  @override
  List<Object?> get props => [
        id,
        notificationType,
        notificationData,
        referenceId,
        createdAt,
        updatedAt,
        notification
      ];
}

class NotificationDataEntity extends Equatable {
  final String? title;
  final String? content;

  NotificationDataEntity({this.title, this.content});

  factory NotificationDataEntity.fromModel(NotificationDataModel model) {
    return NotificationDataEntity(title: model.title, content: model.content);
  }

  @override
  List<Object?> get props => [title, content];
}
