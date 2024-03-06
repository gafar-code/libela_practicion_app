part of components_lib;

enum SecondaryButtonSize { small, medium, large, extraLarge }

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key,
      this.size = SecondaryButtonSize.medium,
      this.text,
      this.isExpanded = false,
      this.isLoading = false,
      this.scale,
      this.onPressed});

  final SecondaryButtonSize size;
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
              backgroundColor: kSofterGrey,
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
      case SecondaryButtonSize.small:
        return 28.h;
      case SecondaryButtonSize.medium:
        return 44.h;
      case SecondaryButtonSize.large:
        return 48.h;
      case SecondaryButtonSize.extraLarge:
        return 58.h;
    }
  }

  TextStyle fonst(AppTheme theme) {
    switch (size) {
      case SecondaryButtonSize.small:
        return theme.font.f10.secondary.semibold;
      case SecondaryButtonSize.medium:
        return theme.font.f14.secondary.semibold;
      case SecondaryButtonSize.large:
        return theme.font.f16.secondary.semibold;
      case SecondaryButtonSize.extraLarge:
        return theme.font.f16.secondary.semibold;
    }
  }

  BorderRadius borderRadius(AppTheme theme) {
    switch (size) {
      case SecondaryButtonSize.small:
        return theme.style.borderRadius.allSmall;
      case SecondaryButtonSize.medium:
        return theme.style.borderRadius.allSmall;
      case SecondaryButtonSize.large:
        return theme.style.borderRadius.allSmall;
      case SecondaryButtonSize.extraLarge:
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
