import 'package:libela_practition/app/features/profile/data/models/update_profile.dart';
import 'package:libela_practition/app/features/profile/data/models/user_profile.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/bank_account_body.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/change_phone_request_body.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/profile_body.dart';

import '../../../../core/network/endpoints.dart';
import '../../../../core/network/remote_data_source_impl.dart';
import '../../../../core/network/request_remote.dart';
import '../../../../core/network/upload_file_body.dart';
import '../../presentation/utils/model/change_phone_verify_body.dart';
import '../../presentation/utils/model/delete_bank_account_body.dart';
import '../../presentation/utils/model/image_body.dart';
import '../../presentation/utils/model/update_email_body.dart';
import '../models/bank_account.dart';
import '../models/banks.dart';
import '../models/change_phone.dart';
import '../models/faq.dart';
import 'profile_remote_data_source.dart';

class ProfileRemoteDataSourcesImpl extends RemoteDataSourceImpl
    implements ProfileRemoteDataSource {
  ProfileRemoteDataSourcesImpl(super.client);

  @override
  Future<UserProfileModel> getUserProfile() async {
    final response = await hitAPI(() => get(Endpoints.userProfile));
    return UserProfileModel.fromJson(response['data']);
  }

  @override
  Future<String> uploadImages(ImageUploadBody data) async {
    var body = UploadImageBody(data.fileName ?? '', data.file ?? '');
    final response =
        await hitAPI(() => uploadImage(Endpoints.uploadAvatar, body));
    return response['data']['url'];
  }

  @override
  Future<UpdateProfileModel> updateProfile(ProfileBody body) async {
    final response = await hitAPI(() => put(Endpoints.userProfile, body: body));
    return UpdateProfileModel.fromJson(response['data']);
  }

  @override
  Future<ChangePhoneModel> changePhone(ChangePhoneRequestBody body) async {
    final response =
        await hitAPI(() => post(Endpoints.changePhoneRequest, body));
    return ChangePhoneModel.fromJson(response['data']);
  }

  @override
  Future<String> verifychangePhone(ChangePhoneVerifyBody body) async {
    final response =
        await hitAPI(() => post(Endpoints.changePhoneVerify, body));
    return response['data']['newPhoneNumber'];
  }

  @override
  Future<bool> updateEmail(UpdateEmailBody body) async {
    final response =
        await hitAPI(() => put(Endpoints.personalEmail, body: body));
    return response['code'] == 200;
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

  @override
  Future<bool> deleteBankAccount(DeleteBankAccountBody body) async {
    final response =
        await hitAPI(() => delWithBody(Endpoints.bankAccount, body));
    return response['code'] == 200;
  }

  @override
  Future<List<FaqModel>> getFaq() async {
    final response = await hitAPI(() => get(Endpoints.faq));
    return List.from(response['data'])
        .map((e) => FaqModel.fromJson(e))
        .toList();
  }
}
