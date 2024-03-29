import 'package:flutter/material.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';

class AppBarDetailAppointment extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarDetailAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      title: Text('Detail Appointment', style: theme.font.f16.medium),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
