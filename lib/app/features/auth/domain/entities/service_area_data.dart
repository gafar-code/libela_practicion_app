import 'package:equatable/equatable.dart';

import '../../data/models/service_area_data.dart';

class ServiceAreaDataEntity extends Equatable {
  final int? id;
  final String? createdAt;
  final String? updatedAt;

  const ServiceAreaDataEntity({this.id, this.createdAt, this.updatedAt});

  factory ServiceAreaDataEntity.fromModel(ServiceAreaDataModel model) {
    return ServiceAreaDataEntity(
        id: model.id, createdAt: model.createdAt, updatedAt: model.updatedAt);
  }

  @override
  List<Object?> get props => [id, createdAt, updatedAt];
}
