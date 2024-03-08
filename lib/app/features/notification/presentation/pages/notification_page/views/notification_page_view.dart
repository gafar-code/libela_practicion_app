import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/features/notification/presentation/pages/notification_page/views/section/list_notification.dart';

import '../controllers/notification_page_controller.dart';
import 'section/app_bar.dart';

class NotificationPageView extends GetView<NotificationPageController> {
  const NotificationPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarNotification(),
        body: ListNotification(
          controller: controller,
        ));
  }
}
