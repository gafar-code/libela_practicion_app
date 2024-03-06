import 'package:libela_practition/app/features/profile/data/models/user_profile.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> getUserProfile();
}
