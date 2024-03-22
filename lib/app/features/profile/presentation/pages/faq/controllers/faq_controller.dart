import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/snackbar/app_snackbar.dart';

import '../../../../domain/usecase/get_faq.dart';
import '../../../utils/model/typedef.dart';

class FaqController extends GetxController {
  final GetFaq getFaq;
  FaqController(this.getFaq);

  late List<bool> isExpandedList = [];
  Faqs faqs = [];
  var isLoading = false.obs;

  Future<void> getFaqs() async {
    isLoading(true);
    final result = await getFaq();
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      faqs = data;
      isExpandedList = List.generate(faqs.length, (index) => false);
      update();
    });
    isLoading(false);
  }

  expansionCallback(int index) {
    isExpandedList[index] = !isExpandedList[index];
    update();
  }

  @override
  void onInit() {
    getFaqs();
    super.onInit();
  }
}
