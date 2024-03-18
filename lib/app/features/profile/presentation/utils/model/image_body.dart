import '../../../../../core/network/param.dart';

class ImageUploadBody extends RequestBody {
  final String? fileName;
  final String? type;
  final String? file;

  ImageUploadBody(this.fileName, this.type, this.file);
  @override
  Map<String, dynamic> toJson() => {'fileName': fileName, 'file': file}
    ..removeWhere((key, value) => value == null);

  ImageUploadBody copyWith({
    String? fileName,
    String? type,
    String? file,
  }) {
    return ImageUploadBody(fileName, type, file);
  }
}
