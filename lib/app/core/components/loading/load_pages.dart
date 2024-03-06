import 'package:flutter/material.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';

import '../../../config/theme/colors.dart';

class LoadingPages extends StatelessWidget {
  const LoadingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeightScale(1),
      width: getWidthScale(1),
      color: Colors.white,
      child: const Center(
          child: CircularProgressIndicator(
        color: kPrimaryColor,
      )),
    );
  }
}
