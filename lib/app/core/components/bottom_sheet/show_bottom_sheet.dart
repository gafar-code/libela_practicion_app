part of components_lib;

class CustomBottomSheet {
  static void show({required Widget child}) {
    Get.bottomSheet(child,
        enterBottomSheetDuration: 400.milliseconds,
        exitBottomSheetDuration: 400.milliseconds,
        isScrollControlled: true);
  }
}
