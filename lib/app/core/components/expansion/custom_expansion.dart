part of components_lib;

class CustomExpansion extends StatelessWidget {
  const CustomExpansion(
      {super.key,
      this.title,
      this.content,
      this.isExpanded = false,
      this.onTap});

  final String? title;
  final Widget? content;
  final bool isExpanded;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: theme.style.padding.bottomMedium,
        child: Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: getWidthScale(1),
                padding: theme.style.padding.allMedium,
                decoration: BoxDecoration(
                    borderRadius: theme.style.borderRadius.allMedium,
                    border:
                        Border.all(color: isExpanded ? kInfoColor : kBorder)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title ?? 'Title',
                        style: theme.font.f14.semibold,
                      ),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: isExpanded ? kInfoColor : kBorder,
                    )
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: 300.milliseconds,
              curve: Curves.easeInOut,
              child: Visibility(
                visible: isExpanded,
                child: Padding(
                    padding: theme.style.padding.topMedium,
                    child: content != null
                        ? Container(
                            width: getWidthScale(1),
                            padding: theme.style.padding.allMedium,
                            decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius:
                                    theme.style.borderRadius.allMedium,
                                border: Border.all(color: kBorder)),
                            child: content,
                          )
                        : SizedBox.shrink()),
              ),
            ),
          ],
        ));
  }
}
