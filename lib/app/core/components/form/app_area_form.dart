part of components_lib;

enum AppAreaFormType { normal, withLabel }

class AppAreaForm extends StatelessWidget {
  const AppAreaForm({
    super.key,
    required this.controller,
    this.label,
    this.icon,
    this.isError = false,
    this.hintText,
    this.textAlign,
    this.type = AppAreaFormType.normal,
    this.textArea = false,
    this.keyboardType,
    this.focusNode,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
  });

  final TextEditingController controller;
  final String? label;
  final String? icon;
  final bool isError;
  final String? hintText;
  final TextAlign? textAlign;
  final AppAreaFormType type;
  final bool textArea;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  @override
  Widget build(BuildContext context) {
    return type == AppAreaFormType.normal
        ? _buildNormalForm(theme)
        : _buildWithLabel(theme);
  }

  Widget _buildNormalForm(AppTheme theme) {
    return SizedBox(
      height: textArea ? 70.h : 44.h,
      width: getWidthScale(1),
      child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          cursorColor: kPrimaryColor,
          style: theme.font.f14.black,
          maxLines: textArea ? 5 : 1,
          textAlign: textAlign ?? TextAlign.left,
          onChanged: onChanged,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.font.f14.copyWith(color: kSoftGrey),
            filled: true,
            fillColor: kWhiteColor,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
          )),
    );
  }

  Widget _buildWithLabel(AppTheme theme) {
    return SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label ?? 'Label', style: theme.font.f14.black),
        Gap(8.h),
        _buildNormalForm(theme)
      ]),
    );
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: kSofterGrey));
  }
}
