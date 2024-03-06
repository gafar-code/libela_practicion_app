import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:libela_practition/app/config/di/injection_container.dart';
import 'package:libela_practition/app/core/utils/app_storage/app_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/constant/constant.dart';
// import '../infrastructure/dal/services/firebase/firebase_api.dart';

class AppConfig {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await dotenv.load(fileName: environmentPath.path).then((value) {
      kBaseUrl = dotenv.env['BASE_URL']!;
      apiKey = dotenv.env['API_KEY']!;
      kApiUrl = dotenv.env['MAPS_URL']!;
      publicApi = dotenv.env['PUBLIC_API']!;
    });
    await initializeDepedencies();
    await AppStorage.init();
    await Permission.storage.request();
    await Permission.manageExternalStorage.isGranted;
    await Permission.camera.request();
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);
    // await DeeplinkService.getLink();
    // await DeeplinkService.getInitialLink();
    // await FirebaseService.getInitialMessage();
    // await FirebaseService().initNotification();
    // await AppPreference.init();
    // await RemoteProvider.init();
  }
}
