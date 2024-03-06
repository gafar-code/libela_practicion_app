import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../config/theme/colors.dart';
import '../controllers/new_number_controller.dart';
import 'section/form.dart';
import 'section/header.dart';

class NewNumberView extends GetView<NewNumberController> {
  const NewNumberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          children: [HeaderSection(), FormSection()],
        ));
  }
}
