import 'package:get/get.dart';

class FaqController extends GetxController {
  List<bool> isExpandedList = [false, false];
  expansionCallback(int index, bool isExpanded) {
    isExpandedList[index] = isExpanded;
    update();
  }
}
