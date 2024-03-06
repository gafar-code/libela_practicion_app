import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/biodata_controller.dart';
import '../controllers/document_controller.dart';
import '../controllers/profession_controller.dart';
import '../controllers/register_form_controller.dart';
import '../controllers/service_area.dart';

class RegisterFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterFormController());
    Get.put(RegisterBiodataController(sl(), sl(), sl(), sl()));
    Get.put(RegisterProfessionController(sl(), sl(), sl()));
    Get.put(RegisterServiceAreaController(sl(), sl(), sl()));
    Get.put(RegisterDocumentController(sl(), sl()));
  }
}
