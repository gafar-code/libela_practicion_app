import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/features/auth/domain/entities/uploaded_file.dart';
import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../controllers/document_controller.dart';

class UploadCard extends StatelessWidget {
  const UploadCard(
      {super.key,
      this.label,
      this.isUploaded = false,
      required this.type,
      this.file,
      this.onTap,
      this.isLoading = false});

  final String? label;
  final bool isUploaded;
  final UploadType type;
  final Function()? onTap;
  final UploadedFile? file;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? 'Label',
          style: theme.font.f14,
        ),
        Gap(12.h),
        Visibility(
          visible: isUploaded == false,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 100.h,
              width: theme.style.fullWidth,
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allSmall,
                  color: kSofterGrey),
              child: isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LocalAssets.svg(upload),
                        Gap(6.h),
                        Text('Upload dokumen',
                            style: theme.font.f14.copyWith(color: kSoftGrey))
                      ],
                    ),
            ),
          ),
        ),
        Visibility(
            visible: isUploaded == true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100.r,
                  width: 100.r,
                  padding: theme.style.padding.allSmall.copyWith(bottom: 0),
                  decoration: BoxDecoration(
                      borderRadius: theme.style.borderRadius.allSmall,
                      color: kSofterGrey),
                  child: ClipRRect(
                    borderRadius: theme.style.borderRadius.allSmall,
                    child: Image.memory(
                      file?.file ?? Uint8List(0),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(8.h),
                Text(file?.fileName ?? '', style: theme.font.f12),
              ],
            )),
        Gap(16.h),
      ],
    );
  }
}
