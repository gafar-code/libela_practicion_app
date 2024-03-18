import 'package:libela_practition/app/features/profile/data/models/user_profile.dart';

import '../../presentation/utils/model/image_body.dart';
import '../../presentation/utils/model/profile_body.dart';
import '../models/update_profile.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> getUserProfile();
  Future<String> uploadImages(ImageUploadBody body);
  Future<UpdateProfileModel> updateProfile(ProfileBody body);
}
