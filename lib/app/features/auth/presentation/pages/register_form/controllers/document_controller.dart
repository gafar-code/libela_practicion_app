// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/snackbar/app_snackbar.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_document_data.dart';
import 'package:pdfx/pdfx.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../core/utils/snackbar_helper.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../domain/entities/file_upload.dart';
import '../../../../domain/usecase/upload_file.dart';
import '../../../utils/model/file_body.dart';
import '../../../utils/model/personal_document_body.dart';
import '../../../utils/model/typedef.dart';
import 'register_form_controller.dart';

enum UploadType { str, sip, ktp }

class RegisterDocumentController extends GetxController {
  final UploadFile _uploadFile;
  final UpdateDocumentData _updateDocumentData;
  RegisterDocumentController(this._uploadFile, this._updateDocumentData);

  final registerController = Get.find<RegisterFormController>();

// Data Loading
  UploadedStrLoading uploadedStrLoading = false;
  UploadedSipLoading uploadedSipLoading = false;
  UploadedKtpLoading uploadedKtpLoading = false;
  UploadDocumentDataLoading uploadDocumentDataLoading = false;

// Selected Data
  UploadedStr? uploadedStr;
  UploadedSip? uploadedSip;
  UploadedKtp? uploadedKtp;

  onSelectFile(
      {Uint8List? file,
      String? path,
      String? fileName,
      UploadType? type,
      String? message}) {
    if (message == null) {
      String typeUpload = type == UploadType.str
          ? 'str'
          : type == UploadType.sip
              ? 'sip'
              : 'ktp';
      var body = FileUploadBody(fileName, typeUpload, path);
      uploadFile(body, path, fileName, type);
      update();
    } else {
      SnackBarHelper.showSnackBarError(Get.context!, message);
    }
  }

  Future<void> uploadFile(FileUploadBody body, String? path, String? fileName,
      UploadType? type) async {
    if (type == UploadType.str) {
      uploadedStr = null;
      uploadedStrLoading = true;
    } else if (type == UploadType.sip) {
      uploadedSip = null;
      uploadedSipLoading = true;
    } else {
      uploadedKtp = null;
      uploadedKtpLoading = true;
    }
    update();
    final result = await _uploadFile(body);
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      getImageFromPdf(path ?? '', fileName ?? '', type, data);
      AppSnackbar.show(message: 'Berhasil upload file');
    });
    if (type == UploadType.str) {
      uploadedStr = null;
      uploadedStrLoading = false;
    } else if (type == UploadType.sip) {
      uploadedSip = null;
      uploadedSipLoading = false;
    } else {
      uploadedKtp = null;
      uploadedKtpLoading = false;
    }
    update();
  }

  Future<void> getImageFromPdf(String path, String fileName, UploadType? type,
      UploadFileEntity data) async {
    if (await Permission.storage.request().isGranted) {
      final documentFromPath = await PdfDocument.openFile(path);
      final page = await documentFromPath.getPage(1);
      final image = await page.render(
        width: page.width * 3,
        height: page.height * 3,
        format: PdfPageImageFormat.jpeg,
        backgroundColor: '#ffffff',
      );
      if (type == UploadType.str) {
        uploadedStr = UploadedStr(
            file: image?.bytes,
            fileName: fileName,
            presingedUrl: data.presingedUrl,
            key: data.key);
      } else if (type == UploadType.sip) {
        uploadedSip = UploadedSip(
            file: image?.bytes,
            fileName: fileName,
            presingedUrl: data.presingedUrl,
            key: data.key);
      } else {
        uploadedKtp = UploadedKtp(
            file: image?.bytes,
            fileName: fileName,
            presingedUrl: data.presingedUrl,
            key: data.key);
      }
      update();
    } else {
      print('Izin akses ke penyimpanan tidak diberikan.');
    }
  }

  void next() {
    registerController.next();
  }

  void previous() {
    registerController.previous();
  }

  Future<void> uploadDocumentData() async {
    uploadDocumentDataLoading = true;
    update();
    var body = PersonalDocumentBody(
      str: uploadedStr?.key ?? '',
      sip: uploadedSip?.key ?? '',
      ktp: uploadedKtp?.key ?? '',
    );
    final result = await _updateDocumentData(body);
    result.fold((error) {
      SnackBarHelper.showSnackBarError(Get.context!, error.message);
    }, (data) {
      Get.offAllNamed(Routes.VERIFICATION_INFO);
    });
    uploadDocumentDataLoading = false;
    update();
  }
}
