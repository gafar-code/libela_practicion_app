import 'package:equatable/equatable.dart';

import '../../data/models/update_profile.dart';

class UpdateProfileEntity extends Equatable {
  final String? avatar;
  final String? aboutme;

  UpdateProfileEntity({this.avatar, this.aboutme});

  factory UpdateProfileEntity.fromModel(UpdateProfileModel model) {
    return UpdateProfileEntity(
      avatar: model.avatar,
      aboutme: model.aboutme,
    );
  }

  @override
  List<Object?> get props => [avatar, aboutme];
}
