part of components_lib;

enum MixButtonSize { small, medium, large, extraLarge }

class MixButton extends StatelessWidget {
  const MixButton(
      {super.key,
      this.size = MixButtonSize.medium,
      this.textLeft,
      this.textRight,
      this.isExpanded = false,
      this.isLoading = false,
      this.scale,
      this.onPressedLeft,
      this.onPressedRight});

  final MixButtonSize size;
  final String? textLeft;
  final String? textRight;
  final bool isExpanded;
  final bool isLoading;
  final double? scale;
  final Function()? onPressedLeft;
  final Function()? onPressedRight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightButton,
      width: theme.style.fullWidth,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kSofterGrey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadius(theme),
                    )),
                onPressed: onPressedLeft,
                child: Text(textLeft ?? "Button",
                    style: fonstSecondary(theme),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis)),
          ),
          Gap(12.w),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadius(theme),
                    )),
                onPressed: onPressedRight,
                child: isLoading
                    ? onLoadingWidget
                    : Text(textRight ?? "Button",
                        style: fonst(theme),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis)),
          ),
        ],
      ),
    );
  }

  double get heightButton {
    switch (size) {
      case MixButtonSize.small:
        return 28.h;
      case MixButtonSize.medium:
        return 44.h;
      case MixButtonSize.large:
        return 48.h;
      case MixButtonSize.extraLarge:
        return 58.h;
    }
  }

  TextStyle fonst(AppTheme theme) {
    switch (size) {
      case MixButtonSize.small:
        return theme.font.f10.white.semibold;
      case MixButtonSize.medium:
        return theme.font.f14.white.semibold;
      case MixButtonSize.large:
        return theme.font.f16.white.semibold;
      case MixButtonSize.extraLarge:
        return theme.font.f16.white.semibold;
    }
  }

  TextStyle fonstSecondary(AppTheme theme) {
    switch (size) {
      case MixButtonSize.small:
        return theme.font.f10.secondary.semibold;
      case MixButtonSize.medium:
        return theme.font.f14.secondary.semibold;
      case MixButtonSize.large:
        return theme.font.f16.secondary.semibold;
      case MixButtonSize.extraLarge:
        return theme.font.f16.secondary.semibold;
    }
  }

  BorderRadius borderRadius(AppTheme theme) {
    switch (size) {
      case MixButtonSize.small:
        return theme.style.borderRadius.allSmall;
      case MixButtonSize.medium:
        return theme.style.borderRadius.allSmall;
      case MixButtonSize.large:
        return theme.style.borderRadius.allMedium;
      case MixButtonSize.extraLarge:
        return theme.style.borderRadius.allMedium;
    }
  }

  Widget get onLoadingWidget {
    return Center(
        child: SizedBox(
            height: 24.r,
            width: 24.r,
            child: const CircularProgressIndicator(
                strokeWidth: 2, color: kWhiteColor)));
  }
}
