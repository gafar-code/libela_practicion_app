import 'package:libela_practition/app/features/profile/data/models/bank_account.dart';
import 'package:libela_practition/app/features/profile/data/models/banks.dart';
import 'package:libela_practition/app/features/profile/data/models/user_profile.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/change_phone_request_body.dart';

import '../../presentation/utils/model/bank_account_body.dart';
import '../../presentation/utils/model/change_phone_verify_body.dart';
import '../../presentation/utils/model/delete_bank_account_body.dart';
import '../../presentation/utils/model/image_body.dart';
import '../../presentation/utils/model/profile_body.dart';
import '../../presentation/utils/model/update_email_body.dart';
import '../models/change_phone.dart';
import '../models/update_profile.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> getUserProfile();
  Future<String> uploadImages(ImageUploadBody body);
  Future<UpdateProfileModel> updateProfile(ProfileBody body);
  Future<ChangePhoneModel> changePhone(ChangePhoneRequestBody body);
  Future<String> verifychangePhone(ChangePhoneVerifyBody body);
  Future<bool> updateEmail(UpdateEmailBody body);
  Future<List<BanksModel>> getListBank();
  Future<List<BankAccountModel>> getBankAccount();
  Future<bool> createBankAccount(BankAccountBody body);
  Future<bool> deleteBankAccount(DeleteBankAccountBody body);
}
