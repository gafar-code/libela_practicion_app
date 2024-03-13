import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/features/home/presentation/pages/incoming_request/views/section/incoming.dart';

import '../controllers/incoming_request_controller.dart';
import 'section/app_bar.dart';

class IncomingRequestView extends GetView<IncomingRequestController> {
  const IncomingRequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarIncomingRequest(),
        body: IncomingSection(controller: controller));
  }
}
