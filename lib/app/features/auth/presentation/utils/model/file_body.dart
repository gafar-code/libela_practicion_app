import '../../../../../core/network/param.dart';

class FileUploadBody extends RequestBody {
  final String? fileName;
  final String? type;
  final String? file;

  FileUploadBody(this.fileName, this.type, this.file);
  @override
  Map<String, dynamic> toJson() => {'fileName': fileName, 'file': file}
    ..removeWhere((key, value) => value == null);

  FileUploadBody copyWith({
    String? fileName,
    String? type,
    String? file,
  }) {
    return FileUploadBody(fileName, type, file);
  }
}
