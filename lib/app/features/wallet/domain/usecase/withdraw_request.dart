import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/core/usecase/usecase.dart';
import 'package:libela_practition/app/features/wallet/domain/entities/withdraw_request.dart';
import 'package:libela_practition/app/features/wallet/domain/repositories/wallet_repositories.dart';
import 'package:libela_practition/app/features/wallet/presentation/utils/models/withdraw_body.dart';

import '../../../../core/error/error_imports.dart';

class WithdrawRequest extends UseCase<WithdrawRequestEntity, WithdrawBody> {
  final WalletRepositories _walletRepositories;

  WithdrawRequest(this._walletRepositories);

  @override
  Future<Either<RemoteFailure, WithdrawRequestEntity>> call(
      WithdrawBody body) async {
    return _walletRepositories.withdrawRequest(body);
  }
}
