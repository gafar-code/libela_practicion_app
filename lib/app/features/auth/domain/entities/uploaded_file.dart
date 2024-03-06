import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class UploadedFile extends Equatable {
  final Uint8List? file;
  final String? fileName;
  final String? presingedUrl;
  final String? key;

  const UploadedFile({this.file, this.fileName, this.presingedUrl, this.key});

  @override
  List<Object?> get props => [file, fileName, presingedUrl, key];
}
