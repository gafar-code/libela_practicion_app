import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/entities/update_profile.dart';
import 'package:libela_practition/app/features/profile/domain/entities/user_profile.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/change_phone_request_body.dart';

import '../../../../core/error/error_imports.dart';
import '../../presentation/utils/model/bank_account_body.dart';
import '../../presentation/utils/model/change_phone_verify_body.dart';
import '../../presentation/utils/model/delete_bank_account_body.dart';
import '../../presentation/utils/model/image_body.dart';
import '../../presentation/utils/model/profile_body.dart';
import '../../presentation/utils/model/typedef.dart';
import '../../presentation/utils/model/update_email_body.dart';
import '../entities/change_phone.dart';
import '../entities/faq.dart';

abstract class ProfileRepositories {
  Future<Either<RemoteFailure, UserProfileEntity>> getUserProfile();
  Future<Either<RemoteFailure, String>> uploadImage(ImageUploadBody body);
  Future<Either<RemoteFailure, UpdateProfileEntity>> updateProfile(
      ProfileBody body);
  Future<Either<RemoteFailure, ChangePhoneEntity>> changePhone(
      ChangePhoneRequestBody body);
  Future<Either<RemoteFailure, String>> verifychangePhone(
      ChangePhoneVerifyBody body);

  Future<Either<RemoteFailure, bool>> updateEmail(UpdateEmailBody body);
  Future<Either<RemoteFailure, Banks>> getListBank();
  Future<Either<RemoteFailure, BankAccounts>> getBankAccount();
  Future<Either<RemoteFailure, bool>> createBankAccount(BankAccountBody body);
  Future<Either<RemoteFailure, bool>> deleteBankAccount(
      DeleteBankAccountBody body);
  Future<Either<RemoteFailure, List<FaqEntity>>> getFaq();
}
