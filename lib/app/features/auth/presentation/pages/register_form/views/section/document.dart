import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/views/widget/upload_card.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../controllers/document_controller.dart';

class DocumentSection extends StatelessWidget {
  const DocumentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterDocumentController>(builder: (controller) {
      bool isUploadedStr = controller.uploadedStr?.isSuccessUpload ?? false;
      bool isUploadedSip = controller.uploadedSip?.isSuccessUpload ?? false;
      bool isUploadedKtp = controller.uploadedKtp?.isSuccessUpload ?? false;
      bool isUploadStrVailed = controller.uploadedStr?.isVailedUpload ?? false;
      bool isUploadSipVailed = controller.uploadedSip?.isVailedUpload ?? false;
      bool isUploadKtpVailed = controller.uploadedKtp?.isVailedUpload ?? false;
      bool enableButton = isUploadedStr && isUploadedSip && isUploadedKtp;

      return ListView(
        children: [
          UploadCard(
            type: UploadType.str,
            label: 'STR (Surat Tanda Registrasi)',
            isUploaded: isUploadedStr,
            file: controller.uploadedStr,
            isVailed: isUploadStrVailed,
            isLoading: controller.uploadedStrLoading,
            onTap: () {
              Get.bottomSheet(
                  enterBottomSheetDuration: 200.milliseconds,
                  exitBottomSheetDuration: 200.milliseconds, PickerFile(
                onSelect: (filePath, filename, message) {
                  controller.onSelectFile(
                      path: filePath,
                      fileName: filename,
                      type: UploadType.str,
                      message: message);
                },
              ));
            },
          ),
          UploadCard(
            type: UploadType.sip,
            label: 'SIP (Surat Izin Praktek)',
            isUploaded: isUploadedSip,
            file: controller.uploadedSip,
            isLoading: controller.uploadedSipLoading,
            isVailed: isUploadSipVailed,
            onTap: () {
              Get.bottomSheet(
                  enterBottomSheetDuration: 200.milliseconds,
                  exitBottomSheetDuration: 200.milliseconds, PickerFile(
                onSelect: (filePath, filename, message) {
                  controller.onSelectFile(
                      path: filePath,
                      fileName: filename,
                      type: UploadType.sip,
                      message: message);
                },
              ));
            },
          ),
          UploadCard(
            type: UploadType.ktp,
            label: 'KTP (Kartu Tanda Penduduk)',
            isUploaded: isUploadedKtp,
            file: controller.uploadedKtp,
            isLoading: controller.uploadedKtpLoading,
            isVailed: isUploadKtpVailed,
            onTap: () {
              Get.bottomSheet(
                  enterBottomSheetDuration: 200.milliseconds,
                  exitBottomSheetDuration: 200.milliseconds, PickerFile(
                onSelect: (filePath, filename, message) {
                  controller.onSelectFile(
                      path: filePath,
                      fileName: filename,
                      type: UploadType.ktp,
                      message: message);
                },
              ));
            },
          ),
          Gap(12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_rounded,
                size: 12.r,
                color: kInfoColor,
              ),
              Gap(6.w),
              Expanded(
                child: Text(
                    'Pastikan file tidak lebih dari 5 MB Upload file harus dalam bentuk pdf',
                    style: theme.font.f12.copyWith(color: kInfoColor)),
              ),
            ],
          ),
          Gap(36.h),
          MixButton(
            isLoading: controller.uploadDocumentDataLoading,
            textLeft: 'Kembali',
            textRight: 'Selanjutnya',
            onPressedLeft: () => controller.previous(),
            onPressedRight:
                enableButton ? () => controller.uploadDocumentData() : null,
          )
        ],
      );
    });
  }
}
