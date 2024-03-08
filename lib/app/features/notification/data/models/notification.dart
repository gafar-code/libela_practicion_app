class NotificationModel {
  String? id;
  String? notificationType;
  String? notificationData;
  String? referenceId;
  String? createdAt;
  String? updatedAt;
  NotificationDataModel? notification;

  NotificationModel(
      {this.id,
      this.notificationType,
      this.notificationData,
      this.referenceId,
      this.createdAt,
      this.updatedAt,
      this.notification});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationType = json['notificationType'];
    notificationData = json['notificationData'];
    referenceId = json['referenceId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    notification = json['notification'] != null
        ? new NotificationDataModel.fromJson(json['notification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notificationType'] = this.notificationType;
    data['notificationData'] = this.notificationData;
    data['referenceId'] = this.referenceId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.notification != null) {
      data['notification'] = this.notification!.toJson();
    }
    return data;
  }
}

class NotificationDataModel {
  String? title;
  String? content;

  NotificationDataModel({this.title, this.content});

  NotificationDataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
