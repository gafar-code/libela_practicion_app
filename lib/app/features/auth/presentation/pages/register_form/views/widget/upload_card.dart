import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
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
      this.reupload,
      this.isLoading = false,
      this.isVailed});

  final String? label;
  final bool isUploaded;
  final UploadType type;
  final Function()? onTap;
  final Function()? reupload;

  final UploadedFile? file;
  final bool isLoading;
  final bool? isVailed;

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
            visible: isLoading == true,
            child: Stack(
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: 100.r,
                      //   width: 100.r,
                      //   padding:
                      //       theme.style.padding.allSmall.copyWith(bottom: 0),
                      //   decoration: BoxDecoration(
                      //       borderRadius: theme.style.borderRadius.allSmall,
                      //       color: kSofterGrey),
                      //   child: ClipRRect(
                      //     borderRadius: theme.style.borderRadius.allSmall,
                      //     child: file?.file != null
                      //         ? Image.memory(
                      //             file?.file ?? Uint8List(0),
                      //             fit: BoxFit.cover,
                      //           )
                      //         : null,
                      //   ),
                      // ),
                      Container(
                        height: 100.r,
                        width: 100.r,
                        padding:
                            theme.style.padding.allSmall.copyWith(bottom: 0),
                        decoration: BoxDecoration(
                            borderRadius: theme.style.borderRadius.allSmall,
                            color: kSofterGrey),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: theme.style.borderRadius.allSmall,
                              image: file != null && file?.path != null
                                  ? DecorationImage(
                                      image: FileImage(File(file!.path!)),
                                      fit: BoxFit.cover,
                                    )
                                  : null),
                        ),
                      ),
                      Gap(8.h),
                      Text(file?.fileName ?? '', style: theme.font.f12),
                    ],
                  ),
                ),
                Container(
                  height: 100.r,
                  width: 100.r,
                  padding: theme.style.padding.allLarge,
                  decoration: BoxDecoration(
                      borderRadius: theme.style.borderRadius.allSmall,
                      color: kBlackColor.withOpacity(0.5)),
                  child: SizedBox(
                      height: 50.r,
                      width: 50.r,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ))),
                )
              ],
            )),
        Visibility(
            visible: isLoading == false && isVailed == true,
            child: Stack(
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100.r,
                            width: 100.r,
                            padding: theme.style.padding.allSmall
                                .copyWith(bottom: 0),
                            decoration: BoxDecoration(
                                borderRadius: theme.style.borderRadius.allSmall,
                                color: kSofterGrey),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      theme.style.borderRadius.allSmall,
                                  image: file != null && file?.path != null
                                      ? DecorationImage(
                                          image: FileImage(File(file!.path!)),
                                          fit: BoxFit.cover,
                                        )
                                      : null),
                            ),
                          ),
                          Gap(16.w),
                          PrimaryButton(
                            size: PrimaryButtonSize.small,
                            text: 'Upload Ulang',
                            onPressed: onTap,
                          )
                        ],
                      ),
                      Gap(8.h),
                      Text(file?.fileName ?? '', style: theme.font.f12),
                    ],
                  ),
                ),
                Container(
                  height: 100.r,
                  width: 100.r,
                  padding: theme.style.padding.allLarge,
                  decoration: BoxDecoration(
                      borderRadius: theme.style.borderRadius.allSmall,
                      color: kBlackColor.withOpacity(0.5)),
                  child: SizedBox(
                      height: 50.r,
                      width: 50.r,
                      child: Center(
                        child: Icon(
                          Icons.highlight_off_outlined,
                          color: kErrorColor,
                          size: 36.r,
                        ),
                      )),
                )
              ],
            )),
        Visibility(
          visible:
              isLoading == false && isUploaded == false && isVailed == false,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 100.h,
              width: theme.style.fullWidth,
              padding: theme.style.padding.allMedium,
              decoration: BoxDecoration(
                  borderRadius: theme.style.borderRadius.allSmall,
                  color: kSofterGrey),
              child: Column(
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
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: theme.style.borderRadius.allSmall,
                        image: file != null && file?.path != null
                            ? DecorationImage(
                                image: FileImage(File(file!.path!)),
                                fit: BoxFit.cover,
                              )
                            : null),
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
