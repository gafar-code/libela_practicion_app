// ignore_for_file: prefer_null_aware_operators

import 'package:equatable/equatable.dart';
import 'package:libela_practition/app/features/profile/data/models/user_profile.dart';

class UserProfileEntity extends Equatable {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? practitionPhone;
  final String? dateOfBirth;
  final String? address;
  final String? avatar;
  final int? isEmailVerified;
  final String? userLoginLast;
  final int? isApproved;
  final String? userApprovalDate;
  final String? gender;
  final String? education;
  final ProfessionsUserEntity? professions;
  final List<RolesUserEntity>? roles;
  final List<PractitionerServiceAreaUserEntity>? practitionerServiceArea;
  final List<PractititonerServiceSkillUserEntity>? practititonerServiceSkill;
  final bool? isRegistrationComplete;
  final RegistrationCompletionEntity? registrationCompletion;

  const UserProfileEntity(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.practitionPhone,
      this.dateOfBirth,
      this.address,
      this.avatar,
      this.isEmailVerified,
      this.userLoginLast,
      this.isApproved,
      this.userApprovalDate,
      this.gender,
      this.education,
      this.professions,
      this.roles,
      this.practitionerServiceArea,
      this.practititonerServiceSkill,
      this.isRegistrationComplete,
      this.registrationCompletion});

  // create methode fromModel

  factory UserProfileEntity.fromModel(UserProfileModel model) {
    return UserProfileEntity(
      id: model.id,
      email: model.email,
      firstName: model.firstName,
      lastName: model.lastName,
      practitionPhone: model.practitionPhone,
      dateOfBirth: model.dateOfBirth,
      address: model.address,
      avatar: model.avatar,
      isEmailVerified: model.isEmailVerified,
      userLoginLast: model.userLoginLast,
      isApproved: model.isApproved,
      userApprovalDate: model.userApprovalDate,
      gender: model.gender,
      education: model.education,
      professions: model.professions != null
          ? ProfessionsUserEntity.fromModel(model.professions!)
          : null,
      roles: model.roles != null
          ? model.roles?.map((e) => RolesUserEntity.fromModel(e)).toList()
          : null,
      practitionerServiceArea: model.practitionerServiceArea != null
          ? model.practitionerServiceArea
              ?.map((e) => PractitionerServiceAreaUserEntity.fromModel(e))
              .toList()
          : null,
      practititonerServiceSkill: model.practititonerServiceSkill != null
          ? model.practititonerServiceSkill
              ?.map((e) => PractititonerServiceSkillUserEntity.fromModel(e))
              .toList()
          : null,
      isRegistrationComplete: model.isRegistrationComplete,
      registrationCompletion: model.registrationCompletion != null
          ? RegistrationCompletionEntity.fromModel(
              model.registrationCompletion!)
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        practitionPhone,
        dateOfBirth,
        address,
        avatar,
        isEmailVerified,
        userLoginLast,
        isApproved,
        userApprovalDate,
        gender,
        education,
        professions,
        roles,
        practitionerServiceArea,
        practititonerServiceSkill,
        isRegistrationComplete,
        registrationCompletion
      ];
}

class ProfessionsUserEntity extends Equatable {
  final String? id;
  final String? professionName;

  const ProfessionsUserEntity({this.id, this.professionName});

  factory ProfessionsUserEntity.fromModel(ProfessionsUserModel model) {
    return ProfessionsUserEntity(
        id: model.id, professionName: model.professionName);
  }

  @override
  List<Object?> get props => [id, professionName];
}

class RolesUserEntity extends Equatable {
  final String? id;
  final String? name;

  const RolesUserEntity({this.id, this.name});

  factory RolesUserEntity.fromModel(RolesUserModel model) {
    return RolesUserEntity(id: model.id, name: model.name);
  }

  @override
  List<Object?> get props => [id, name];
}

class PractitionerServiceAreaUserEntity extends Equatable {
  final int? id;
  final int? serviceAreasId;
  final ServiceAreasUserEntity? serviceAreas;

  const PractitionerServiceAreaUserEntity(
      {this.id, this.serviceAreasId, this.serviceAreas});

  factory PractitionerServiceAreaUserEntity.fromModel(
      PractitionerServiceAreaUserModel model) {
    return PractitionerServiceAreaUserEntity(
      id: model.id,
      serviceAreasId: model.serviceAreasId,
      serviceAreas: model.serviceAreas != null
          ? ServiceAreasUserEntity.fromModel(model.serviceAreas!)
          : null,
    );
  }

  @override
  List<Object?> get props => [id, serviceAreasId, serviceAreas];
}

class ServiceAreasUserEntity extends Equatable {
  final String? name;

  const ServiceAreasUserEntity({this.name});

  factory ServiceAreasUserEntity.fromModel(ServiceAreasUserModel model) {
    return ServiceAreasUserEntity(name: model.name);
  }

  @override
  List<Object?> get props => [name];
}

class PractititonerServiceSkillUserEntity extends Equatable {
  final int? id;
  final String? skillsId;
  final SkillsUserEntity? skills;

  const PractititonerServiceSkillUserEntity(
      {this.id, this.skillsId, this.skills});

  factory PractititonerServiceSkillUserEntity.fromModel(
      PractititonerServiceSkillUserModel model) {
    return PractititonerServiceSkillUserEntity(
      id: model.id,
      skillsId: model.skillsId,
      skills: model.skills != null
          ? SkillsUserEntity.fromModel(model.skills!)
          : null,
    );
  }

  @override
  List<Object?> get props => [id, skillsId, skills];
}

class SkillsUserEntity extends Equatable {
  final String? subProfessionName;

  const SkillsUserEntity({this.subProfessionName});

  factory SkillsUserEntity.fromModel(SkillsUserModel model) {
    return SkillsUserEntity(subProfessionName: model.subProfessionName);
  }

  @override
  List<Object?> get props => [subProfessionName];
}

class RegistrationCompletionEntity extends Equatable {
  final bool? step1;
  final bool? step2;
  final bool? step3;
  final bool? step4;
  final bool? step5;

  const RegistrationCompletionEntity(
      {this.step1, this.step2, this.step3, this.step4, this.step5});

  factory RegistrationCompletionEntity.fromModel(
      RegistrationCompletionModel model) {
    return RegistrationCompletionEntity(
      step1: model.step1,
      step2: model.step2,
      step3: model.step3,
      step4: model.step4,
      step5: model.step5,
    );
  }

  @override
  List<Object?> get props => [step1, step2, step3, step4, step5];
}
