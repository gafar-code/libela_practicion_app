import 'package:equatable/equatable.dart';

import '../../data/models/service_area.dart';

class ServiceAreaEntity extends Equatable {
  final int? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const ServiceAreaEntity({this.id, this.name, this.createdAt, this.updatedAt});

  factory ServiceAreaEntity.fromModel(ServiceAreaModel serviceArea) {
    return ServiceAreaEntity(
      id: serviceArea.id,
      name: serviceArea.name,
      createdAt: serviceArea.createdAt,
      updatedAt: serviceArea.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt];
}
