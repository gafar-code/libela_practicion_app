import 'dart:typed_data';

import '../../../../../core/network/param.dart';

class ImageUploadBody extends RequestBody {
  final String? name;
  final List<Uint8List> images;

  ImageUploadBody(this.name, this.images);
  @override
  Map<String, dynamic> toJson() => {'fileName': name, 'file': images.first}
    ..removeWhere((key, value) => value == null);

  ImageUploadBody copyWith({
    String? name,
    List<Uint8List>? images,
  }) {
    return ImageUploadBody(name, images!);
  }
}
