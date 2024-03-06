part of components_lib;

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, this.text, this.color, this.onTap});

  final String? text;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text ?? '',
          style: theme.font.f14.copyWith(color: color ?? kInfoColor)),
    );
  }
}
