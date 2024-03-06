// ignore_for_file: prefer_null_aware_operators

import 'package:equatable/equatable.dart';

import '../../data/models/personal_data.dart';

class PersonalDataEntity extends Equatable {
  final String? id;
  final String? email;
  final String? firstName;
  final ProfessionsDataEntity? professions;
  final List<RolesEntity>? roles;
  final String? lastName;
  final String? dateOfBirth;
  final String? gender;
  final int? provinceId;
  final int? cityId;
  final String? address;
  final String? professionsId;
  final String? practitionPhone;
  final String? avatar;

  const PersonalDataEntity(
      {this.id,
      this.email,
      this.firstName,
      this.professions,
      this.roles,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.provinceId,
      this.cityId,
      this.address,
      this.professionsId,
      this.practitionPhone,
      this.avatar});

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        professions,
        roles,
        lastName,
        dateOfBirth,
        gender,
        provinceId,
        cityId,
        address,
        professionsId,
        practitionPhone,
        avatar
      ];

  // create methode fromModel

  factory PersonalDataEntity.fromModel(PersonalDataModel model) {
    return PersonalDataEntity(
        id: model.id,
        email: model.email,
        firstName: model.firstName,
        professions: model.professions != null
            ? ProfessionsDataEntity.fromModel(model: model.professions!)
            : null,
        roles: model.roles != null
            ? model.roles!.map((e) => RolesEntity.fromModel(model: e)).toList()
            : null,
        lastName: model.lastName,
        dateOfBirth: model.dateOfBirth,
        gender: model.gender,
        provinceId: model.provinceId,
        cityId: model.cityId,
        address: model.address,
        professionsId: model.professionsId,
        practitionPhone: model.practitionPhone,
        avatar: model.avatar);
  }
}

class RolesEntity extends Equatable {
  final String? id;
  final String? name;

  const RolesEntity({this.id, this.name});

  @override
  List<Object?> get props => [id, name];

  factory RolesEntity.fromModel({required RolesModel model}) {
    return RolesEntity(id: model.id, name: model.name);
  }
}

class ProfessionsDataEntity extends Equatable {
  final String? id;
  final String? professionName;
  final String? createdAt;
  final String? updatedAt;

  const ProfessionsDataEntity(
      {this.id, this.professionName, this.createdAt, this.updatedAt});

  factory ProfessionsDataEntity.fromModel(
      {required ProfessionsDataModel model}) {
    return ProfessionsDataEntity(
        id: model.id,
        professionName: model.professionName,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt);
  }

  @override
  List<Object?> get props => [id, professionName, createdAt, updatedAt];
}
