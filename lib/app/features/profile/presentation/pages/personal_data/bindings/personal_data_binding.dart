import 'package:get/get.dart';

import '../../../../../../config/di/injection_container.dart';
import '../controllers/edit_biodata_controller.dart';
import '../controllers/edit_profession_controller.dart';
import '../controllers/edit_service_area.dart';
import '../controllers/personal_data_controller.dart';

class PersonalDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalDataController>(
      () => PersonalDataController(),
    );
    Get.put(EditBiodataController(sl(), sl(), sl()));
    Get.put(EditProfessionController(sl(), sl(), sl()));
    Get.put(EditServiceAreaController(sl(), sl(), sl()));
  }
}
