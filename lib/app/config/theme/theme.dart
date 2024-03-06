import 'package:get/get.dart';

import 'font.dart';
import 'style.dart';

class AppTheme {
  AppFonts get font => AppFonts();
  AppStyle get style => AppStyle(Get.context!);
}

AppTheme get theme => AppTheme();
