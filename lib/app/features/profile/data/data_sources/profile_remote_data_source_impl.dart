import 'package:libela_practition/app/features/profile/data/models/update_profile.dart';
import 'package:libela_practition/app/features/profile/data/models/user_profile.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/profile_body.dart';

import '../../../../core/network/endpoints.dart';
import '../../../../core/network/remote_data_source_impl.dart';
import '../../../../core/network/request_remote.dart';
import '../../../../core/network/upload_file_body.dart';
import '../../presentation/utils/model/image_body.dart';
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
}
