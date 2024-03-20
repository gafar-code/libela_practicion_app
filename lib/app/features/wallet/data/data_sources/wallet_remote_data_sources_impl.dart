import 'package:libela_practition/app/features/wallet/data/models/wallet.dart';
import 'package:libela_practition/app/features/wallet/data/models/withdraw_request.dart';

import '../../../../core/network/endpoints.dart';
import '../../../../core/network/remote_data_source_impl.dart';
import '../../../../core/network/request_remote.dart';
import '../../presentation/utils/models/bank_account_body.dart';
import '../../presentation/utils/models/wallet_limit_params.dart';
import '../../presentation/utils/models/withdraw_body.dart';
import '../models/bank_account.dart';
import '../models/banks.dart';
import '../models/transaction_history.dart';
import '../models/transaction_line.dart';
import 'wallet_remote_data_sources.dart';

class WalletRemoteDataSourcesImpl extends RemoteDataSourceImpl
    implements WalletRemoteDataSource {
  WalletRemoteDataSourcesImpl(super.client);

  @override
  Future<WalletModel> getWallet() async {
    final response = await hitAPI(() => get(Endpoints.wallet));
    return WalletModel.fromJson(response['data']);
  }

  @override
  Future<List<TransactionHistoryModel>> getTransactionHistory(
      WalletLimitParams param) async {
    final response = await hitAPI(() => get(Endpoints.transactionsHistory));
    return List.from(response['data'])
        .map((e) => TransactionHistoryModel.fromJson(e))
        .toList();
  }

  Future<List<TransactionLineModel>> getTransactionLine(
      WalletLimitParams param) async {
    final response = await hitAPI(() => get(Endpoints.transactionsLine));
    return List.from(response['data'])
        .map((e) => TransactionLineModel.fromJson(e))
        .toList();
  }

  Future<WithdrawRequestModel> withdrawRequest(WithdrawBody body) async {
    final response = await hitAPI(() => post(Endpoints.walletWithdraw, body));
    return WithdrawRequestModel.fromJson(response['data']);
  }

  @override
  Future<List<BanksModel>> getListBank() async {
    final response = await hitAPI(() => get(Endpoints.banks));
    return List.from(response['data'])
        .map((e) => BanksModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<BankAccountModel>> getBankAccount() async {
    final response = await hitAPI(() => get(Endpoints.bankAccount));
    return List.from(response['data'])
        .map((e) => BankAccountModel.fromJson(e))
        .toList();
  }

  @override
  Future<bool> createBankAccount(BankAccountBody body) async {
    final response = await hitAPI(() => post(Endpoints.bankAccount, body));
    return response['code'] == 200;
  }
}
