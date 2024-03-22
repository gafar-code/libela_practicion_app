import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/entities/bank_account.dart';
import 'package:libela_practition/app/features/profile/domain/entities/banks.dart';
import 'package:libela_practition/app/features/profile/domain/entities/update_profile.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/bank_account_body.dart';

import '../../../../core/error/error_imports.dart';
import '../../domain/entities/change_phone.dart';
import '../../domain/entities/faq.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repositories.dart';
import '../../presentation/utils/model/change_phone_request_body.dart';
import '../../presentation/utils/model/change_phone_verify_body.dart';
import '../../presentation/utils/model/delete_bank_account_body.dart';
import '../../presentation/utils/model/image_body.dart';
import '../../presentation/utils/model/profile_body.dart';
import '../../presentation/utils/model/typedef.dart';
import '../../presentation/utils/model/update_email_body.dart';
import '../data_sources/profile_remote_data_source.dart';

class ProfileRepositoriesImpl implements ProfileRepositories {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  ProfileRepositoriesImpl(this._profileRemoteDataSource);

  @override
  Future<Either<RemoteFailure, UserProfileEntity>> getUserProfile() async {
    try {
      final data = await _profileRemoteDataSource.getUserProfile();
      final userProfile = UserProfileEntity.fromModel(data);
      return Right(userProfile);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, String>> uploadImage(
      ImageUploadBody body) async {
    try {
      final data = await _profileRemoteDataSource.uploadImages(body);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, UpdateProfileEntity>> updateProfile(
      ProfileBody body) async {
    try {
      final data = await _profileRemoteDataSource.updateProfile(body);
      final userProfile = UpdateProfileEntity.fromModel(data);
      return Right(userProfile);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, ChangePhoneEntity>> changePhone(
      ChangePhoneRequestBody body) async {
    try {
      final data = await _profileRemoteDataSource.changePhone(body);
      final userProfile = ChangePhoneEntity.fromModel(data);
      return Right(userProfile);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, String>> verifychangePhone(
      ChangePhoneVerifyBody body) async {
    try {
      final data = await _profileRemoteDataSource.verifychangePhone(body);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, bool>> updateEmail(UpdateEmailBody body) async {
    try {
      final data = await _profileRemoteDataSource.updateEmail(body);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, Banks>> getListBank() async {
    try {
      final data = await _profileRemoteDataSource.getListBank();
      final banks = data.map((e) => BanksEntity.fromModel(e)).toList();
      return Right(banks);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, BankAccounts>> getBankAccount() async {
    try {
      final data = await _profileRemoteDataSource.getBankAccount();
      final banks = data.map((e) => BankAccountEntity.fromModel(e)).toList();
      return Right(banks);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, bool>> createBankAccount(
      BankAccountBody body) async {
    try {
      final data = await _profileRemoteDataSource.createBankAccount(body);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, bool>> deleteBankAccount(
      DeleteBankAccountBody body) async {
    try {
      final data = await _profileRemoteDataSource.deleteBankAccount(body);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  Future<Either<RemoteFailure, List<FaqEntity>>> getFaq() async {
    try {
      final data = await _profileRemoteDataSource.getFaq();
      final faqs = data.map((e) => FaqEntity.fromModel(e)).toList();
      return Right(faqs);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }
}
