import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:libela_practition/app/core/components/snackbar/app_snackbar.dart';
import 'package:libela_practition/app/features/wallet/domain/entities/transaction_line.dart';
import 'package:libela_practition/app/features/wallet/domain/usecase/get_transaction_line.dart';
import 'package:libela_practition/app/features/wallet/domain/usecase/get_wallet.dart';

import '../../../../domain/entities/wallet.dart';
import '../../../utils/models/wallet_limit_params.dart';

class WalletPageController extends GetxController {
  final GetWallet getWallet;
  final GetTransactionLine getTransactionLine;

  WalletPageController(this.getWallet, this.getTransactionLine);

  late PagingController<int, TransactionLineEntity> pagingController;
  List<TransactionLineEntity> listDummy = [];
  WalletEntity? wallet;
  int _limit = 5;

  var isHideSaldo = false;

  Future<void> getWalletData() async {
    final result = await getWallet();
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      wallet = data;
      update();
    });
  }

  Future<void> getTransactionHistory(int pageKey) async {
    try {
      _limit += 5;
      var param = WalletLimitParams(_limit);
      final response = await getTransactionLine(param);
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

  void toggleHideSaldo() {
    isHideSaldo = !isHideSaldo;
    update();
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
        (index) => TransactionLineEntity(
            id: "${index + 1}",
            item: items[index],
            transactionStatus: status[index],
            createdAt: '2024-03-10T11:00:00.000Z'));
  }

  @override
  void onInit() {
    getWalletData();
    // pagingController = PagingController(firstPageKey: 1);
    // pagingController.addPageRequestListener((pageKey) {
    //   getTransactionHistory(pageKey);
    // });
    setDummy();
    super.onInit();
  }
}
