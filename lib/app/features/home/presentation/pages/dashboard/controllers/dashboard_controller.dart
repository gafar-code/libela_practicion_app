import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/dialog/confirmation_dialog.dart';

class DashboardController extends GetxController {
  int isSectionStarted = 0;

  void openDialogStartSection() {
    ConfirmationDialog.show(
      title: 'Mulai Sesi Praktek',
      message: 'Yakin ingin mulai sesi praktek sekarang?',
      onTapText: 'mulai',
      onPressed: () {
        Get.back();
        isSectionStarted = 1;
        update();
      },
    );
  }
}
