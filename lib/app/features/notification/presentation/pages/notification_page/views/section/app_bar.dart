import 'package:flutter/material.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';

class AppBarNotification extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      title: Text('Notifikasi', style: theme.font.f16.medium),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
