import 'dart:typed_data';

import 'param.dart';

class UploadImageBody extends RequestBody {
  final String name;
  final List<Uint8List> image64;

  UploadImageBody(this.name, this.image64);

  @override
  Map<String, dynamic> toJson() => {'name': name, 'image': image64.first};
}

class UploadFileBody extends RequestBody {
  final String fileName;
  final String type;
  final String path;

  UploadFileBody(this.fileName, this.type, this.path);

  @override
  Map<String, dynamic> toJson() => {'fileName': fileName, 'file': path};
}
