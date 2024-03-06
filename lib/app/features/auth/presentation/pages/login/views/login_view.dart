import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/login/views/section/form.dart';

import '../controllers/login_controller.dart';
import 'section/header.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          children: [HeaderSection(), FormSection()],
        ));
  }
}
