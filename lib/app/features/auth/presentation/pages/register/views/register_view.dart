import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../config/theme/colors.dart';
import '../controllers/register_controller.dart';
import 'section/form.dart';
import 'section/header.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          children: [HeaderSection(), FormSection()],
        ));
  }
}
