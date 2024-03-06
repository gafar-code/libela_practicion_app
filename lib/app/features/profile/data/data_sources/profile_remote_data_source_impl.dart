import 'package:libela_practition/app/features/profile/data/models/user_profile.dart';

import '../../../../core/network/endpoints.dart';
import '../../../../core/network/remote_data_source_impl.dart';
import '../../../../core/network/request_remote.dart';
import 'profile_remote_data_source.dart';

class ProfileRemoteDataSourcesImpl extends RemoteDataSourceImpl
    implements ProfileRemoteDataSource {
  ProfileRemoteDataSourcesImpl(super.client);

  @override
  Future<UserProfileModel> getUserProfile() async {
    final response = await hitAPI(() => get(Endpoints.userProfile));
    return UserProfileModel.fromJson(response['data']);
  }
}
