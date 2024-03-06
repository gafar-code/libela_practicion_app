part of components_lib;

class CardBorder extends StatelessWidget {
  const CardBorder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.style.padding.allLarge,
      decoration: BoxDecoration(
        borderRadius: theme.style.borderRadius.allLarge,
        border: theme.style.boder,
      ),
      child: child,
    );
  }
}
