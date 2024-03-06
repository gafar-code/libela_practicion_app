import 'package:equatable/equatable.dart';

import '../../data/models/specialization.dart';

class SpecializationEntity extends Equatable {
  final String? id;
  final String? professionId;
  final String? subProfessionName;
  final String? slug;
  final String? createdAt;
  final String? updatedAt;

  const SpecializationEntity(
      {this.id,
      this.professionId,
      this.subProfessionName,
      this.slug,
      this.createdAt,
      this.updatedAt});

  factory SpecializationEntity.fromModel(SpecializationModel specialization) {
    return SpecializationEntity(
      id: specialization.id,
      professionId: specialization.professionId,
      subProfessionName: specialization.subProfessionName,
      slug: specialization.slug,
      createdAt: specialization.createdAt,
      updatedAt: specialization.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, professionId, subProfessionName, slug];
}
