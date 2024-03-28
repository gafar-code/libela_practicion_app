import 'package:equatable/equatable.dart';

class UploadedFile extends Equatable {
  final String? path;
  final String? fileName;
  final String? presingedUrl;
  final String? key;
  final bool? isSuccessUpload;
  final bool? isVailedUpload;

  const UploadedFile(
      {this.path,
      this.fileName,
      this.presingedUrl,
      this.key,
      this.isSuccessUpload,
      this.isVailedUpload});

  UploadedFile copyWith({
    String? path,
    String? fileName,
    String? presingedUrl,
    String? key,
    bool? isSuccessUpload,
    bool? isVailedUpload,
  }) {
    return UploadedFile(
        path: path ?? this.path,
        fileName: fileName ?? this.fileName,
        presingedUrl: presingedUrl ?? this.presingedUrl,
        key: key ?? this.key,
        isSuccessUpload: isSuccessUpload ?? this.isSuccessUpload,
        isVailedUpload: isVailedUpload ?? this.isVailedUpload);
  }

  @override
  List<Object?> get props =>
      [path, fileName, presingedUrl, key, isSuccessUpload, isVailedUpload];
}
