import 'package:equatable/equatable.dart';

import '../../data/models/file_upload.dart';

class UploadFileEntity extends Equatable {
  final String? presingedUrl;
  final String? key;

  const UploadFileEntity({this.presingedUrl, this.key});

  factory UploadFileEntity.fromModel(UploadFileModel model) {
    return UploadFileEntity(
      presingedUrl: model.presingedUrl,
      key: model.key,
    );
  }

  @override
  List<Object?> get props => [presingedUrl, key];
}
