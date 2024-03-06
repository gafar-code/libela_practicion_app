import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/config/app_config.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await AppConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widgets) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: GetMaterialApp(
              initialRoute: AppPages.INITIAL,
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              theme: ThemeData(
                  useMaterial3: true,
                  bottomSheetTheme: const BottomSheetThemeData(
                      backgroundColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent)),
              getPages: AppPages.routes,
            ),
          );
        });
  }
}
