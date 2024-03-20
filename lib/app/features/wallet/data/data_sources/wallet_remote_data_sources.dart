import 'package:libela_practition/app/features/wallet/data/models/transaction_history.dart';
import 'package:libela_practition/app/features/wallet/data/models/withdraw_request.dart';

import '../../presentation/utils/models/bank_account_body.dart';
import '../../presentation/utils/models/wallet_limit_params.dart';
import '../../presentation/utils/models/withdraw_body.dart';
import '../models/bank_account.dart';
import '../models/banks.dart';
import '../models/transaction_line.dart';
import '../models/wallet.dart';

abstract class WalletRemoteDataSource {
  Future<WalletModel> getWallet();
  Future<List<TransactionHistoryModel>> getTransactionHistory(
      WalletLimitParams param);
  Future<List<TransactionLineModel>> getTransactionLine(
      WalletLimitParams param);
  Future<WithdrawRequestModel> withdrawRequest(WithdrawBody body);
  Future<List<BanksModel>> getListBank();
  Future<List<BankAccountModel>> getBankAccount();
  Future<bool> createBankAccount(BankAccountBody body);
}
