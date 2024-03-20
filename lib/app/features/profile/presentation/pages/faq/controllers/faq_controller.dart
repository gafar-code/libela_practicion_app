import 'package:get/get.dart';

class FaqController extends GetxController {
  List<bool> isExpandedList = [false, false, false, false];
  expansionCallback(int index) {
    isExpandedList[index] = !isExpandedList[index];
    update();
  }
}
