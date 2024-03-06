part of components_lib;

typedef OnImagePickerCallBack = Function(String path, String? filename);

class PickerImages extends StatelessWidget {
  const PickerImages.single(
      {super.key,
      this.isDouble = false,
      // this.onTapCamera,
      // this.onTapGallery,
      this.onSelect});
  const PickerImages.double(
      {super.key,
      this.isDouble = true,
      // this.onTapCamera,
      // this.onTapGallery,
      this.onSelect});

  final bool isDouble;
  // final GestureTapCallback? onTapCamera;
  // final GestureTapCallback? onTapGallery;
  final OnImagePickerCallBack? onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.style.padding.allLarge,
      height: 120.h,
      width: Get.width,
      decoration: const BoxDecoration(
        color: Color(0xFF232323),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 12.w),
          isDouble != false
              ? InkWell(
                  onTap: () async => _accessMobileCamera(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 32.w,
                        width: 32.w,
                        child: SvgPicture.asset(camera),
                      ),
                      SizedBox(height: 6.w),
                      Text('Camera',
                          style: GoogleFonts.inter(
                              fontSize: 12, color: const Color(0xFFA3A3A3)))
                    ],
                  ),
                )
              : const SizedBox(),
          isDouble != false ? SizedBox(width: 26.w) : const SizedBox(),
          InkWell(
            onTap: () async => await _accessMobileGallery(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 32.w,
                  width: 32.w,
                  child: SvgPicture.asset(photoGallery),
                ),
                SizedBox(height: 6.w),
                Text('Gallery',
                    style: GoogleFonts.inter(
                        fontSize: 12, color: const Color(0xFFA3A3A3)))
              ],
            ),
          ),
        ],
      ),
    );
  }

  _accessMobileCamera(BuildContext context) async {
    Permission.camera.request().then((status) async {
      if (status.isGranted) {
        Get.back();
        var image = await ImagePicker().pickImage(
            source: ImageSource.camera, maxHeight: 1200, maxWidth: 1200);
        if (image != null) onSelect!(image.path, image.name);
      } else {
        openAppSettings();
        // context.showConfirmDialog(
        //   DialogUIModel(
        //     title: 'Akses Kamera',
        //     description: permissionPurpose,
        //     positiveLabel: 'OK',
        //     onPositive: openAppSettings,
        //   ),
        // );
      }
    });
  }

  _accessMobileGallery(BuildContext context) {
    final permission = Platform.isAndroid
        ? Permission.mediaLibrary.request()
        : Permission.photos.request();
    permission.then((status) async {
      if (status.isGranted) {
        Get.back();

        var image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxHeight: 1200,
          maxWidth: 1200,
        );

        if (image != null) {
          var splitter = image.path.split('/').last.split('.');
          bool isContains(String format) => splitter.last.contains(format);
          if (isContains('jpg') || isContains('jpeg') || isContains('png')) {
            onSelect!(image.path, image.name);
          } else {
            // ignore: use_build_context_synchronously
            // context.showError('Format Gambar harus JPG/JPEG/PNG');
          }
        }
      } else {
        openAppSettings();
        // context.showConfirmDialog(
        //   DialogUIModel(
        //     title: 'Akses Galeri',
        //     description: permissionPurpose,
        //     positiveLabel: 'OK',
        //     onPositive: openAppSettings,
        //   ),
        // );
      }
    });
  }
}
