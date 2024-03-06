import 'package:flutter/material.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/theme.dart';

AppBar get appBarRegister {
  return AppBar(
    backgroundColor: kWhiteColor,
    title: Text('Register', style: theme.font.f16),
  );
}
