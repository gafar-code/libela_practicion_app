// ignore_for_file: prefer_null_aware_operators

import 'package:equatable/equatable.dart';
import 'package:libela_practition/app/features/profile/data/models/user_profile.dart';

class UserProfileEntity extends Equatable {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? aboutme;
  final String? practitionPhone;
  final String? identityNumber;
  final String? dateOfBirth;
  final String? address;
  final String? avatar;
  final int? isEmailVerified;
  final String? userLoginLast;
  final int? isApproved;
  final String? userApprovalDate;
  final String? gender;
  final String? education;
  final int? provinceId;
  final int? cityId;
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
      this.aboutme,
      this.practitionPhone,
      this.identityNumber,
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
      this.provinceId,
      this.cityId,
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
      aboutme: model.aboutme,
      practitionPhone: model.practitionPhone,
      identityNumber: model.identityNumber,
      dateOfBirth: model.dateOfBirth,
      address: model.address,
      avatar: model.avatar,
      isEmailVerified: model.isEmailVerified,
      userLoginLast: model.userLoginLast,
      isApproved: model.isApproved,
      userApprovalDate: model.userApprovalDate,
      gender: model.gender,
      education: model.education,
      provinceId: model.provinceId,
      cityId: model.cityId,
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

  // create function copyWith
  UserProfileEntity copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? aboutme,
    String? practitionPhone,
    String? identityNumber,
    String? dateOfBirth,
    String? address,
    String? avatar,
    int? isEmailVerified,
    String? userLoginLast,
    int? isApproved,
    String? userApprovalDate,
    String? gender,
    String? education,
    int? provinceId,
    int? cityId,
    ProfessionsUserEntity? professions,
    List<RolesUserEntity>? roles,
    List<PractitionerServiceAreaUserEntity>? practitionerServiceArea,
    List<PractititonerServiceSkillUserEntity>? practititonerServiceSkill,
    bool? isRegistrationComplete,
    RegistrationCompletionEntity? registrationCompletion,
  }) {
    return UserProfileEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      aboutme: aboutme ?? this.aboutme,
      practitionPhone: practitionPhone ?? this.practitionPhone,
      identityNumber: identityNumber ?? this.identityNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      address: address ?? this.address,
      avatar: avatar ?? this.avatar,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      userLoginLast: userLoginLast ?? this.userLoginLast,
      isApproved: isApproved ?? this.isApproved,
      userApprovalDate: userApprovalDate ?? this.userApprovalDate,
      gender: gender ?? this.gender,
      education: education ?? this.education,
      provinceId: provinceId ?? this.provinceId,
      cityId: cityId ?? this.cityId,
      professions: professions ?? this.professions,
      roles: roles ?? this.roles,
      practitionerServiceArea:
          practitionerServiceArea ?? this.practitionerServiceArea,
      practititonerServiceSkill:
          practititonerServiceSkill ?? this.practititonerServiceSkill,
      isRegistrationComplete:
          isRegistrationComplete ?? this.isRegistrationComplete,
      registrationCompletion:
          registrationCompletion ?? this.registrationCompletion,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        aboutme,
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
