import 'package:equatable/equatable.dart';

import '../../data/models/cities.dart';

class CitiesEntity extends Equatable {
  final int? id;
  final int? provinceId;
  final String? name;

  const CitiesEntity({this.id, this.provinceId, this.name});

  factory CitiesEntity.fromModel(CitiesModel cities) {
    return CitiesEntity(
      id: cities.id,
      provinceId: cities.provinceId,
      name: cities.name,
    );
  }

  @override
  List<Object?> get props => [id, provinceId, name];
}
