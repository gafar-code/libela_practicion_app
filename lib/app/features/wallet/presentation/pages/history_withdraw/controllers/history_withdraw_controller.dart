import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../../core/components/snackbar/app_snackbar.dart';
import '../../../../domain/entities/transaction_history.dart';
import '../../../../domain/usecase/get_transaction_history.dart';
import '../../../utils/models/wallet_limit_params.dart';

class HistoryWithdrawController extends GetxController {
  final GetTransactionHistory _getTransactionHistory;
  HistoryWithdrawController(this._getTransactionHistory);

  late PagingController<int, TransactionHistoryEntity> pagingController;
  List<TransactionHistoryEntity> listDummy = [];
  int _limit = 5;

  var isHideSaldo = false;

  List<dynamic> filters = [
    {'filter': 'Hari Ini', 'value': 'today'},
    {'filter': 'Kemaren', 'value': 'yesterday'},
    {'filter': 'Terlama', 'value': 'pastdays'},
  ];

  String? selectedFilter;

  Future<void> getTransactionHistory(int pageKey) async {
    try {
      _limit += 5;
      var param = WalletLimitParams(_limit);
      final response = await _getTransactionHistory(param);
      response.fold((error) {
        AppSnackbar.show(message: error.message, type: SnackType.error);
      }, (data) {
        final isLastPage = data.length < _limit;

        if (isLastPage) {
          pagingController.appendLastPage(data);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(data, nextPageKey);
        }
      });
    } catch (error) {
      pagingController.error = error;
    }
  }

  void filterByStatus(String value) {
    selectedFilter = value;
    listDummy.firstWhere((element) => element.transactionStatus == value);
    update();
    // pagingController.refresh();
  }

  List<String> items = [
    'Berhasil melakukan penarikan dana sebesar Rp1.000.000 ke rekeningmu',
    'Gagal melakukan penarikan dana sebesar Rp500.000',
    'Permintaan penarikan dana sebesar Rp1.000.000 menunggu persetujuan admin'
  ];

  List<String> status = ['success', 'failed', 'waiting_approval'];

  setDummy() {
    listDummy = List.generate(
        3,
        (index) => TransactionHistoryEntity(
            id: "${index + 1}",
            item: items[index],
            transactionStatus: status[index],
            createdAt: '2024-03-10T11:00:00.000Z'));
  }

  @override
  void onInit() {
    pagingController = PagingController(firstPageKey: 1);
    // pagingController.addPageRequestListener((pageKey) {
    //   getTransactionHistory(pageKey);
    // });
    setDummy();
    super.onInit();
  }
}
