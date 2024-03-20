import 'package:flutter/material.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';

class AppBarAddRekeningWallet extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarAddRekeningWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      title: Text('Tambah Rekening', style: theme.font.f16.medium),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
