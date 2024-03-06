import 'package:equatable/equatable.dart';
import '../../data/models/provinces.dart';

class ProvincesEntity extends Equatable {
  final int? id;
  final String? name;

  const ProvincesEntity({this.id, this.name});

  factory ProvincesEntity.fromModel(ProvincesModel profession) {
    return ProvincesEntity(
      id: profession.id,
      name: profession.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
