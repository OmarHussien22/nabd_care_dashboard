part of 'imports_text_field.dart';

class TextFieldDefault extends StatefulWidget {
  //<editor-fold desc="Imps">
  final PrefixImp prefix;
  final SuffixImp suffix;
  final InputDecorationImp inputDecoration;
  final TFFTextImp hint;
  final TFFTextImp label;
  final TFFTextImp error;
  final TFFTextImp input;
  final TFFTextImp header;
  //</editor-fold>
  //<editor-fold desc="Input Style">
  final int maxLines;
  final TextEditingController? controller;
  final SecureType secureType;
  //</editor-fold>
  //<editor-fold desc="Actions">
  /// AppValidator
  final String? Function(String?)? validation;
  final Function(String)? onChanged;
  final VoidCallback? onComplete;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onTap;
  final Function(PointerDownEvent)? onTapOutside;
  //</editor-fold>
  //<editor-fold desc="Padding">
  final double horizontalPadding;
  final double verticalPadding;
  final EdgeInsets surroundingPadding;
  //</editor-fold>
  //<editor-fold desc="Types">
  final bool enable;
  final bool isRequired;
  final bool readOnly;
  //</editor-fold>
  final IconData? icon;
  final Color? cursorColor;
  final Color? fillColor;
  final bool isFilled;
  final Color? iconColor;
  final bool isRounded;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final double? width;
  final double? height;
  const TextFieldDefault({
    super.key,
    this.prefix = const PrefixNone(),
    this.suffix = const SuffixNone(),
    this.inputDecoration = const InputDecorationWithBorder(),
    this.hint = const TFFHint(),
    this.label = const TFFNone(),
    this.error = const TFFError(),
    this.input = const TFFInput(),
    this.header = const TFFNone(),
    this.controller,
    this.fillColor,
    this.isRounded = false,
    this.validation,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onComplete,
    this.onSaved,
    this.maxLines = 1,
    this.enable = true,
    this.cursorColor,
    this.horizontalPadding = 19.0,
    this.verticalPadding = 14.0,
    this.icon,
    this.iconColor,
    this.keyboardType,
    this.textInputAction,
    this.secureType = SecureType.never,
    this.isRequired = false,
    this.isFilled = false,
    this.readOnly = false,
    this.surroundingPadding = EdgeInsets.zero,
    this.autovalidateMode,
    this.focusNode,
    this.textAlign,
    this.width,
    this.height,
  });

  @override
  _TextFieldDefaultState createState() => _TextFieldDefaultState();
}

class _TextFieldDefaultState extends State<TextFieldDefault> {
  bool secureState = true;
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust width based on screen type
    double finalWidth = widget.width ?? double.infinity;
    if (screenWidth >= 1024) {
      // Desktop
      finalWidth = widget.width ?? screenWidth * 0.5;
    } else if (screenWidth >= 600) {
      // Tablet
      finalWidth = widget.width ?? screenWidth * 0.75;
    } else {
      // Mobile
      finalWidth = widget.width ?? screenWidth * 0.9;
    }

    // Adjust height based on screen type
    double? finalHeight = widget.height;
    if (finalHeight != null) {
      if (screenWidth >= 1024) {
        finalHeight = finalHeight * 1.5; // Desktop
      } else if (screenWidth >= 600) {
        finalHeight = finalHeight * 1.25; // Tablet
      }
    }

    // Adjust height (vertical padding) if حابب
    double verticalPadding = widget.verticalPadding;
    if (screenWidth >= 1024) {
      verticalPadding = widget.verticalPadding * 1.5; // Desktop
    } else if (screenWidth >= 600) {
      verticalPadding = widget.verticalPadding * 1.2; // Tablet
    }

    return Stack(
      children: [
        Padding(
          padding: widget.surroundingPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TFFHeaderBuilder(header: widget.header),
                ],
              ),
              SizedBox(
                width: finalWidth, // Use calculated width
                height: finalHeight?.toH(), // Use calculated height
                child: TextFormField(
                  autocorrect: true,
                  focusNode: widget.focusNode,
                  readOnly: widget.readOnly,
                  onTap: widget.onTap,
                  textAlign: widget.textAlign ?? TextAlign.start,
                  obscureText: widget.suffix is SuffixPassword
                      ? (widget.suffix as SuffixPassword).showPassword
                      : TFFStyles.getObscureText(
                          widget.secureType,
                          secureState: secureState,
                        ),
                  onTapOutside: widget.onTapOutside ??
                      (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  onEditingComplete: widget.onComplete,
                  onChanged: widget.onChanged,
                  onSaved: widget.onSaved,
                  controller: widget.controller,
                  cursorColor: widget.cursorColor ?? AppColors.get.tTFCursor,
                  autovalidateMode: widget.autovalidateMode,
                  enabled: widget.enable,
                  maxLines: widget.maxLines,
                  validator:
                      widget.validation ?? AppValidator.noneValidator.validate,
                  style: widget.input.getTextStyle,
                  decoration: InputDecoration(
                    icon: widget.icon != null
                        ? Icon(
                            widget.icon,
                            color: widget.iconColor,
                            size: 24.toW(),
                          )
                        : null,
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
                      vertical: verticalPadding.toH(),
                      horizontal: widget.horizontalPadding.toW(),
                    ),
                    prefixIcon: widget.prefix.render(context),
                    prefixText: widget.prefix is PrefixWithText
                        ? widget.prefix.title ?? ""
                        : null,
                    prefixStyle: widget.prefix is PrefixWithText
                        ? TextStyle(
                            color: widget.prefix.color,
                            fontSize: widget.prefix.fontSize,
                            fontWeight: widget.prefix.fontWeight,
                          )
                        : null,
                    prefixIconConstraints: widget.prefix.getBoxConstraints,
                    suffixIcon: widget.suffix.render(context),
                    suffixText: widget.suffix is SuffixWithText
                        ? widget.suffix.title ?? ""
                        : null,
                    suffixStyle: widget.suffix is SuffixWithText
                        ? TextStyle(
                            color: widget.suffix.color,
                            fontSize: widget.suffix.fontSize,
                            fontWeight: widget.suffix.fontWeight,
                          )
                        : null,
                    suffixIconConstraints: widget.suffix.getBoxConstraints,
                    border: TffBorders.getBorder(
                      inputDecoration: widget.inputDecoration,
                      type: BorderType.border,
                    ),
                    disabledBorder: TffBorders.getBorder(
                      inputDecoration: widget.inputDecoration,
                      type: BorderType.disabled,
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
        ),
      ],
    );
  }
}
