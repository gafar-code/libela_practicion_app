import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class UploadedFile extends Equatable {
  final Uint8List? file;
  final String? fileName;
  final String? presingedUrl;
  final String? key;
  final bool? isSuccessUpload;
  final bool? isVailedUpload;

  const UploadedFile(
      {this.file,
      this.fileName,
      this.presingedUrl,
      this.key,
      this.isSuccessUpload,
      this.isVailedUpload});

  UploadedFile copyWith({
    Uint8List? file,
    String? fileName,
    String? presingedUrl,
    String? key,
    bool? isSuccessUpload,
    bool? isVailedUpload,
  }) {
    return UploadedFile(
        file: file ?? this.file,
        fileName: fileName ?? this.fileName,
        presingedUrl: presingedUrl ?? this.presingedUrl,
        key: key ?? this.key,
        isSuccessUpload: isSuccessUpload ?? this.isSuccessUpload,
        isVailedUpload: isVailedUpload ?? this.isVailedUpload);
  }

  @override
  List<Object?> get props =>
      [file, fileName, presingedUrl, key, isSuccessUpload, isVailedUpload];
}
