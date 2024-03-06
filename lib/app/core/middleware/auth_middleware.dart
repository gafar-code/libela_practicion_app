import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/utils/app_storage/app_storage.dart';
import 'package:libela_practition/app/features/auth/data/models/auth_token.dart';

import '../../routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    AuthToken? auth = AppStorage().getAuthToken();
    if (auth?.token == null) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
