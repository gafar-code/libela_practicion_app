part of components_lib;

enum PrimaryAccentButtonSize { small, medium, large, extraLarge }

class PrimaryAccentButton extends StatelessWidget {
  const PrimaryAccentButton(
      {super.key,
      this.size = PrimaryAccentButtonSize.medium,
      this.text,
      this.isExpanded = false,
      this.isLoading = false,
      this.scale,
      this.onPressed});

  final PrimaryAccentButtonSize size;
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
              backgroundColor: kSecondaryAccentColor,
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
      case PrimaryAccentButtonSize.small:
        return 28.h;
      case PrimaryAccentButtonSize.medium:
        return 44.h;
      case PrimaryAccentButtonSize.large:
        return 48.h;
      case PrimaryAccentButtonSize.extraLarge:
        return 58.h;
    }
  }

  TextStyle fonst(AppTheme theme) {
    switch (size) {
      case PrimaryAccentButtonSize.small:
        return theme.font.f10.white.semibold;
      case PrimaryAccentButtonSize.medium:
        return theme.font.f14.white.semibold;
      case PrimaryAccentButtonSize.large:
        return theme.font.f16.white.semibold;
      case PrimaryAccentButtonSize.extraLarge:
        return theme.font.f16.white.semibold;
    }
  }

  BorderRadius borderRadius(AppTheme theme) {
    switch (size) {
      case PrimaryAccentButtonSize.small:
        return theme.style.borderRadius.allSmall;
      case PrimaryAccentButtonSize.medium:
        return theme.style.borderRadius.allSmall;
      case PrimaryAccentButtonSize.large:
        return theme.style.borderRadius.allSmall;
      case PrimaryAccentButtonSize.extraLarge:
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
