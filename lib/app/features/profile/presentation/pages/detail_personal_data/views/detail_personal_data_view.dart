import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_personal_data_controller.dart';

class DetailPersonalDataView extends GetView<DetailPersonalDataController> {
  const DetailPersonalDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPersonalDataView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailPersonalDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
