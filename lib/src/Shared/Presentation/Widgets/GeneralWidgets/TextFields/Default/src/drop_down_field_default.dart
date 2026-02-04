part of 'imports_text_field.dart';

class DropdownFieldDefault<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final Function(T?)? onChanged;
  
  // نفس خصائص TextFieldDefault لتوحيد الشكل
  final InputDecorationImp inputDecoration;
  final TFFTextImp hint;
  final TFFTextImp label;
  final TFFTextImp error;
  final TFFTextImp header;
  final PrefixImp prefix;
  final SuffixImp suffix;
  
  final String? Function(T?)? validation;
  final bool enable;
  final bool isFilled;
  final Color? fillColor;
  final double horizontalPadding;
  final double verticalPadding;
  final EdgeInsets surroundingPadding;
  final double? width;

  const DropdownFieldDefault({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.prefix = const PrefixNone(),
    this.suffix = const SuffixNone(),
    this.inputDecoration = const InputDecorationWithBorder(),
    this.hint = const TFFHint(),
    this.label = const TFFNone(),
    this.error = const TFFError(),
    this.header = const TFFNone(),
    this.enable = true,
    this.isFilled = false,
    this.fillColor,
    this.horizontalPadding = 19.0,
    this.verticalPadding = 14.0,
    this.surroundingPadding = EdgeInsets.zero,
    this.validation,
    this.width,
  });

  @override
  State<DropdownFieldDefault<T>> createState() => _DropdownFieldDefaultState<T>();
}

class _DropdownFieldDefaultState<T> extends State<DropdownFieldDefault<T>> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // حساب الـ Width بنفس منطق الـ TextFieldDefault
    double finalWidth = widget.width ?? double.infinity;
    if (screenWidth >= 1024) finalWidth = widget.width ?? screenWidth * 0.5;
    else if (screenWidth >= 600) finalWidth = widget.width ?? screenWidth * 0.75;
    else finalWidth = widget.width ?? screenWidth * 0.9;

    return Padding(
      padding: widget.surroundingPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TFFHeaderBuilder(header: widget.header),
          SizedBox(
            width: finalWidth,
            child: DropdownButtonFormField<T>(
              value: widget.value,
              items: widget.items,
              onChanged: widget.enable ? widget.onChanged : null,
              validator: widget.validation,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TFFInput().getTextStyle, // أو ستايل الإدخال الموحد عندك
              icon: widget.suffix is SuffixNone 
                  ? const Icon(Icons.arrow_drop_down) 
                  : widget.suffix.render(context),
              decoration: InputDecoration(
                fillColor: widget.isFilled
                    ? widget.fillColor ?? AppColors.get.tFFFillColor
                    : null,
                filled: widget.isFilled,
                hintText: widget.hint.title.noneNull.toTr(),
                hintStyle: widget.hint.getTextStyle,
                labelText: widget.label.title,
                labelStyle: widget.label.getTextStyle,
                errorStyle: widget.error.getTextStyle,
                contentPadding: EdgeInsets.symmetric(
                  vertical: widget.verticalPadding.toH(),
                  horizontal: widget.horizontalPadding.toW(),
                ),
                prefixIcon: widget.prefix.render(context),
                // استخدام نفس نظام الـ Borders الموحد في المشروع
                border: TffBorders.getBorder(
                  inputDecoration: widget.inputDecoration,
                  type: BorderType.border,
                ),
                enabledBorder: TffBorders.getBorder(
                  inputDecoration: widget.inputDecoration,
                  type: BorderType.enable,
                ),
                focusedBorder: TffBorders.getBorder(
                  inputDecoration: widget.inputDecoration,
                  type: BorderType.focus,
                ),
                errorBorder: TffBorders.getBorder(
                  inputDecoration: widget.inputDecoration,
                  type: BorderType.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}