// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/snackbar/app_snackbar.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_document_data.dart';

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
      if (path != null && path != '') {
        String typeUpload = type == UploadType.str
            ? 'str'
            : type == UploadType.sip
                ? 'sip'
                : 'ktp';
        var body = FileUploadBody(fileName, typeUpload, path);

        update();
        setImageThumbnile(path, fileName ?? '', type, null);
        uploadFile(body, path, fileName, type);
        update();
      } else {
        AppSnackbar.show(message: 'File Tidak Valid', type: SnackType.error);
      }
    } else {
      SnackBarHelper.showSnackBarError(Get.context!, message);
    }
  }

  Future<void> uploadFile(FileUploadBody body, String? path, String? fileName,
      UploadType? type) async {
    if (type == UploadType.str) {
      // uploadedStr = null;
      uploadedStrLoading = true;
    } else if (type == UploadType.sip) {
      // uploadedSip = null;
      uploadedSipLoading = true;
    } else {
      // uploadedKtp = null;
      uploadedKtpLoading = true;
    }

    update();
    final result = await _uploadFile(body);
    result.fold((error) {
      if (type == UploadType.str) {
        uploadedStr = uploadedStr?.copyWith(
            presingedUrl: uploadedStr?.presingedUrl,
            key: uploadedStr?.key,
            isVailedUpload: true,
            isSuccessUpload: false);
      } else if (type == UploadType.sip) {
        uploadedSip = uploadedSip?.copyWith(
            presingedUrl: uploadedStr?.presingedUrl,
            key: uploadedStr?.key,
            isVailedUpload: true,
            isSuccessUpload: false);
      } else {
        uploadedKtp = uploadedKtp?.copyWith(
            presingedUrl: uploadedStr?.presingedUrl,
            key: uploadedStr?.key,
            isVailedUpload: true,
            isSuccessUpload: false);
      }
      update();
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      if (type == UploadType.str) {
        uploadedStr = uploadedStr?.copyWith(
            presingedUrl: data.presingedUrl,
            key: data.key,
            isVailedUpload: false,
            isSuccessUpload: true);
      } else if (type == UploadType.sip) {
        uploadedSip = uploadedSip?.copyWith(
            presingedUrl: data.presingedUrl,
            key: data.key,
            isVailedUpload: false,
            isSuccessUpload: true);
      } else {
        uploadedKtp = uploadedKtp?.copyWith(
            presingedUrl: data.presingedUrl,
            key: data.key,
            isVailedUpload: false,
            isSuccessUpload: true);
      }
      update();
      AppSnackbar.show(message: 'Berhasil upload file');
    });
    if (type == UploadType.str) {
      uploadedStrLoading = false;
    } else if (type == UploadType.sip) {
      uploadedSipLoading = false;
    } else {
      uploadedKtpLoading = false;
    }
    update();
  }

  Future<void> setImageThumbnile(String path, String fileName, UploadType? type,
      UploadFileEntity? data) async {
    if (type == UploadType.str) {
      uploadedStr = UploadedStr(
          path: path,
          fileName: fileName,
          presingedUrl: data?.presingedUrl,
          key: data?.key);
    } else if (type == UploadType.sip) {
      uploadedSip = UploadedSip(
          path: path,
          fileName: fileName,
          presingedUrl: data?.presingedUrl,
          key: data?.key);
    } else {
      uploadedKtp = UploadedKtp(
          path: path,
          fileName: fileName,
          presingedUrl: data?.presingedUrl,
          key: data?.key);
    }
    update();
  }

  // Future<void> getImageFromPdf(String path, String fileName, UploadType? type,
  //     UploadFileEntity? data) async {
  //   if (await Permission.storage.request().isGranted) {
  //     final documentFromPath = await PdfDocument.openFile(path);
  //     final page = await documentFromPath.getPage(1);
  //     final image = await page.render(
  //       width: page.width * 3,
  //       height: page.height * 3,
  //       format: PdfPageImageFormat.jpeg,
  //       backgroundColor: '#ffffff',
  //     );
  //     if (type == UploadType.str) {
  //       uploadedStr = UploadedStr(
  //           file: image?.bytes,
  //           fileName: fileName,
  //           presingedUrl: data?.presingedUrl,
  //           key: data?.key);
  //     } else if (type == UploadType.sip) {
  //       uploadedSip = UploadedSip(
  //           file: image?.bytes,
  //           fileName: fileName,
  //           presingedUrl: data?.presingedUrl,
  //           key: data?.key);
  //     } else {
  //       uploadedKtp = UploadedKtp(
  //           file: image?.bytes,
  //           fileName: fileName,
  //           presingedUrl: data?.presingedUrl,
  //           key: data?.key);
  //     }
  //     update();
  //   } else {
  //     print('Izin akses ke penyimpanan tidak diberikan.');
  //   }
  // }

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
      str: uploadedStr?.presingedUrl ?? '',
      sip: uploadedSip?.presingedUrl ?? '',
      ktp: uploadedKtp?.presingedUrl ?? '',
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
