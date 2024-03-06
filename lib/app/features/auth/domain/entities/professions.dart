import 'package:equatable/equatable.dart';

import '../../data/models/professions.dart';

class ProfessionsEntity extends Equatable {
  final String? id;
  final String? professionName;
  final List<SubProfessionEntity>? subProfession;

  const ProfessionsEntity({this.id, this.professionName, this.subProfession});

  factory ProfessionsEntity.fromModel(ProfessionsModel professions) {
    return ProfessionsEntity(
      id: professions.id,
      professionName: professions.professionName,
      subProfession: professions.subProfession
          ?.map((e) => SubProfessionEntity.fromModel(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, professionName, subProfession];
}

class SubProfessionEntity extends Equatable {
  final String? id;
  final String? professionId;
  final String? subProfessionName;
  final String? slug;
  final String? createdAt;
  final String? updatedAt;

  const SubProfessionEntity({
    this.id,
    this.professionId,
    this.subProfessionName,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory SubProfessionEntity.fromModel(SubProfession subProfession) {
    return SubProfessionEntity(
      id: subProfession.id,
      professionId: subProfession.professionId,
      subProfessionName: subProfession.subProfessionName,
      slug: subProfession.slug,
      createdAt: subProfession.createdAt,
      updatedAt: subProfession.updatedAt,
    );
  }

  @override
  List<Object?> get props =>
      [id, professionId, subProfessionName, slug, createdAt, updatedAt];
}
