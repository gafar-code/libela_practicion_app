part of components_lib;

class SelectButton extends StatelessWidget {
  const SelectButton(
      {super.key, this.text, this.iSelected = false, this.onTap});

  final String? text;
  final bool iSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: theme.style.padding.allSmall,
        decoration: BoxDecoration(
          borderRadius: theme.style.borderRadius.allSmall,
          color: kSofterGrey,
          border: Border.all(color: iSelected ? kPrimaryColor : kSofterGrey),
        ),
        child: Text(text ?? '',
            style: theme.font.f14
                .copyWith(color: iSelected ? kPrimaryColor : kSoftGrey)),
      ),
    );
  }
}
