part of components_lib;

enum PrimaryButtonSize { small, medium, large, extraLarge }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.size = PrimaryButtonSize.medium,
      this.text,
      this.isExpanded = false,
      this.isLoading = false,
      this.scale,
      this.onPressed});

  final PrimaryButtonSize size;
  final String? text;
  final bool isExpanded;
  final bool isLoading;
  final double? scale;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightButton,
      width: scale != null
          ? getWidthScale(scale ?? 1)
          : isExpanded
              ? theme.style.fullWidth
              : null,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius(theme),
              )),
          onPressed: onPressed,
          child: isLoading
              ? onLoadingWidget
              : Text(text ?? "Button",
                  style: fonst(theme),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis)),
    );
  }

  double get heightButton {
    switch (size) {
      case PrimaryButtonSize.small:
        return 28.h;
      case PrimaryButtonSize.medium:
        return 44.h;
      case PrimaryButtonSize.large:
        return 48.h;
      case PrimaryButtonSize.extraLarge:
        return 58.h;
    }
  }

  TextStyle fonst(AppTheme theme) {
    switch (size) {
      case PrimaryButtonSize.small:
        return theme.font.f10.white.semibold;
      case PrimaryButtonSize.medium:
        return theme.font.f14.white.semibold;
      case PrimaryButtonSize.large:
        return theme.font.f16.white.semibold;
      case PrimaryButtonSize.extraLarge:
        return theme.font.f16.white.semibold;
    }
  }

  BorderRadius borderRadius(AppTheme theme) {
    switch (size) {
      case PrimaryButtonSize.small:
        return theme.style.borderRadius.allSmall;
      case PrimaryButtonSize.medium:
        return theme.style.borderRadius.allSmall;
      case PrimaryButtonSize.large:
        return theme.style.borderRadius.allSmall;
      case PrimaryButtonSize.extraLarge:
        return theme.style.borderRadius.allSmall;
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
