part of components_lib;

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet(
      {super.key,
      required this.textButton,
      required this.child,
      this.isFooter = true,
      this.isLoading = false,
      this.gapBottom,
      this.onPressed});
  const AppBottomSheet.witoutFooter(
      {super.key,
      this.textButton = "",
      required this.child,
      this.isFooter = false,
      this.isLoading = false,
      this.gapBottom,
      this.onPressed});

  final String textButton;
  final Widget child;
  final bool isFooter;
  final bool isLoading;
  final double? gapBottom;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidthScale(1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: getHeightScale(1.2),
            minHeight: getHeightScale(10),
          ),
          child: Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  SizedBox(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(6.h),
                        Padding(
                          padding: EdgeInsets.all(16.r),
                          child: SizedBox(child: child),
                        ),
                        SizedBox(height: isFooter ? gapBottom ?? 100.w : 32.w),
                      ],
                    ),
                  )),
                  isFooter
                      ? Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                              width: Get.width,
                              child: Container(
                                height: 72.h,
                                padding: EdgeInsets.all(16.r),
                                decoration:
                                    const BoxDecoration(color: kWhiteColor),
                                child: PrimaryButton(
                                    isLoading: isLoading,
                                    text: textButton,
                                    onPressed: onPressed),
                              )))
                      : const SizedBox(),
                ],
              ))),
    );
  }
}
