part of components_lib;

enum SecondaryAccentButtonSize { small, medium, large, extraLarge }

class SecondaryAccentButton extends StatelessWidget {
  const SecondaryAccentButton(
      {super.key,
      this.size = SecondaryAccentButtonSize.medium,
      this.text,
      this.isExpanded = false,
      this.isLoading = false,
      this.scale,
      this.onPressed});

  final SecondaryAccentButtonSize size;
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
              backgroundColor:
                  onPressed != null ? kSecondaryAccentColor2 : kWhiteColor,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: borderRadius(theme))),
          onPressed: onPressed,
          child: isLoading
              ? onLoadingWidget
              : Text(
                  text ?? "Button",
                  style: fonst(theme),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
    );
  }

  double get heightButton {
    switch (size) {
      case SecondaryAccentButtonSize.small:
        return 28.h;
      case SecondaryAccentButtonSize.medium:
        return 44.h;
      case SecondaryAccentButtonSize.large:
        return 48.h;
      case SecondaryAccentButtonSize.extraLarge:
        return 58.h;
    }
  }

  TextStyle fonst(AppTheme theme) {
    switch (size) {
      case SecondaryAccentButtonSize.small:
        return theme.font.f10.secondary.semibold
            .copyWith(color: kSecondaryAccentColor);
      case SecondaryAccentButtonSize.medium:
        return theme.font.f14.secondary.semibold
            .copyWith(color: kSecondaryAccentColor);
      case SecondaryAccentButtonSize.large:
        return theme.font.f16.secondary.semibold
            .copyWith(color: kSecondaryAccentColor);
      case SecondaryAccentButtonSize.extraLarge:
        return theme.font.f16.secondary.semibold
            .copyWith(color: kSecondaryAccentColor);
    }
  }

  BorderRadius borderRadius(AppTheme theme) {
    switch (size) {
      case SecondaryAccentButtonSize.small:
        return theme.style.borderRadius.allSmall;
      case SecondaryAccentButtonSize.medium:
        return theme.style.borderRadius.allSmall;
      case SecondaryAccentButtonSize.large:
        return theme.style.borderRadius.allSmall;
      case SecondaryAccentButtonSize.extraLarge:
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
