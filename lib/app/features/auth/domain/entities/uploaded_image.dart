import 'package:equatable/equatable.dart';

class UploadedImage extends Equatable {
  final String? image;
  final String? fileName;

  const UploadedImage({this.image, this.fileName});

  @override
  List<Object?> get props => [image, fileName];
}
