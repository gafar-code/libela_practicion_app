import 'package:equatable/equatable.dart';
import 'package:libela_practition/app/features/auth/data/models/document_data.dart';

class DocumentDataEntity extends Equatable {
  final int? id;
  final String? createdAt;
  final String? updatedAt;

  const DocumentDataEntity({this.id, this.createdAt, this.updatedAt});

  factory DocumentDataEntity.fromModel(DocumentDataModel model) {
    return DocumentDataEntity(
        id: model.id, createdAt: model.createdAt, updatedAt: model.updatedAt);
  }

  @override
  List<Object?> get props => [id, createdAt, updatedAt];
}
