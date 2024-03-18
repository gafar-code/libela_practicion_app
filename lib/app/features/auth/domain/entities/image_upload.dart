import 'package:equatable/equatable.dart';

import '../../../profile/data/models/image_upload.dart';

class ImageUploadEntity extends Equatable {
  final String? data;

  const ImageUploadEntity({this.data});

  factory ImageUploadEntity.fromModel(UploadImageModel model) {
    return ImageUploadEntity(
      data: model.data ?? '',
    );
  }

  @override
  List<Object?> get props => [data];
}
