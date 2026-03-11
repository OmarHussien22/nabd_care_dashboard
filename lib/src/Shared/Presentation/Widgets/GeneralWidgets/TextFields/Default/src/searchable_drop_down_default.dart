part of 'imports_text_field.dart';

class SearchableFieldDefault<T extends TitleInterface> extends StatefulWidget {
  final List<T> items;
  final String Function(T) itemLabel; // دالة لتحويل العنصر لنص يظهر في القائمة
  final Function(T)? onOptionSelected;
  final String? Function(String?)? validation;
  final String hint;
  final double? width;
  final IconData prefixIcon;
  final String? leadingIcon;
  final Decoration? sheetDecoration;
  final InputDecorationImp? inputDecoration;
  final TextEditingController? controller;
  final PrefixImp? prefix;
  final SuffixImp? suffix;
  final EdgeInsets? surroundingPadding;
  final double? verticalPadding;
  final double? horizontalPadding;
  const SearchableFieldDefault({
    super.key,
    required this.items,
    required this.itemLabel,
    this.onOptionSelected,
    this.validation,
    this.hint = "Search...",
    this.width,
    this.prefixIcon = Icons.search,
    this.sheetDecoration,
    this.inputDecoration,
    this.leadingIcon,
    this.controller,
    this.prefix,
    this.suffix,
    this.surroundingPadding,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  State<SearchableFieldDefault<T>> createState() =>
      _SearchableFieldDefaultState<T>();
}

class _SearchableFieldDefaultState<T extends TitleInterface>
    extends State<SearchableFieldDefault<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late final TextEditingController _internalController;

  TextEditingController get _effectiveController =>
      widget.controller ?? _internalController;
  final FocusNode _focusNode = FocusNode();
  List<T> _filteredData = [];
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _internalController = TextEditingController();
    _filteredData = widget.items;

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        // Reset filter to full list and show overlay when focused
        setState(() {
          _filteredData = widget.items;
        });
        _showOverlay();
      } else {
        _hideOverlay();
      }
    });
  }

  @override
  void didUpdateWidget(covariant SearchableFieldDefault<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _filteredData = widget.items;
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final globalOffset = renderBox.localToGlobal(Offset.zero);
    final availableHeightBelow =
        MediaQuery.sizeOf(context).height - globalOffset.dy - size.height;
    const double dropdownMaxHeight = 250;
    final bool showAtTop = availableHeightBelow < dropdownMaxHeight + 10;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          targetAnchor: showAtTop ? Alignment.topLeft : Alignment.bottomLeft,
          followerAnchor: showAtTop ? Alignment.bottomLeft : Alignment.topLeft,
          offset: Offset(0, showAtTop ? -5 : 5),
          child: TapRegion(
            groupId: _layerLink,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              // color: AppColors.get.activeBackground,
              // يتبع ثيم التطبيق
              child: Container(
                constraints: const BoxConstraints(maxHeight: 230),
                decoration: widget.sheetDecoration ??
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.get.cardFill,
                      border: Border.all(color: AppColors.get.cardBorder),
                    ),
                child: _filteredData.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: AppColors.get.red,
                            ),
                            8.ESW(),
                            CustomText(
                              "no_data_found".toTr(),
                              fontSize: 12,
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: _filteredData.length,
                        separatorBuilder: (context, index) =>
                            Divider(height: 1, color: AppColors.get.cardBorder),
                        itemBuilder: (context, index) {
                          final item = _filteredData[index];
                          return ListTile(
                            dense: true,
                            // focusColor:
                            //     AppColors.get.primary.withValues(alpha: 0.1),
                            // mouseCursor: SystemMouseCursors.click,
                            // splashColor:
                            //     AppColors.get.primary.withValues(alpha: 0.1),
                            // hoverColor:
                            //     AppColors.get.primary.withValues(alpha: 0.1),
                            // selectedColor: AppColors.get.primary,
                            selectedTileColor: AppColors.get.primary,
                            leading: ImageGeneric.asset(
                              url: widget.leadingIcon ?? AppIcons.user,
                              options: ImageOptions(
                                width: 24,
                                height: 24,
                                color: AppColors.get.primary,
                              ),
                            ),
                            //  Icon(
                            //   widget.leadingIcon ?? Icons.person,
                            //   color: AppColors.get.primary,
                            //   size: 20,
                            // ),
                            title: CustomText(widget.itemLabel(item)),

                            onTap: () {
                              final label = widget.itemLabel(item);

                              // Set the text BEFORE hiding overlay
                              _effectiveController.value = TextEditingValue(
                                text: label,
                                selection: TextSelection.collapsed(
                                    offset: label.length),
                              );

                              // Track the selected item
                              setState(() {
                                _selectedItem = item;
                                _filteredData = widget.items;
                              });

                              printDM("Selected: $label");
                              widget.onOptionSelected?.call(item);

                              // Hide overlay directly — do NOT unfocus here
                              // because unfocus() triggers the focus listener
                              // which calls _hideOverlay() again and may
                              // race with our text assignment.
                              _hideOverlay();
                              FocusScope.of(context).unfocus();
                            },
                          );
                        },
                      ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _filterData(String query) {
    // If user is re-typing after a valid selection, clear the selection
    if (_selectedItem != null) {
      final selectedLabel = widget.itemLabel(_selectedItem as T);
      if (query != selectedLabel) {
        setState(() {
          _selectedItem = null;
        });
      }
    }

    setState(() {
      _filteredData = query.isEmpty
          ? widget.items
          : widget.items
              .where((item) => widget
                  .itemLabel(item)
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
    });
    _overlayEntry?.markNeedsBuild();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TapRegion(
        groupId: _layerLink,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        child: TextFieldDefault(
          width: widget.width,
          controller: _effectiveController,
          focusNode: _focusNode,
          onChanged: _filterData,
          validation: widget.validation,
          fillColor: AppColors.get.lighterGrey,
          isFilled: true,
          verticalPadding: widget.verticalPadding ?? 12.toH(),
          horizontalPadding: widget.horizontalPadding ?? 12.toW(),
          surroundingPadding: widget.surroundingPadding ??
              EdgeInsets.symmetric(horizontal: 12.toW(), vertical: 12.toH()),
          onTapOutside: (event) {
            _hideOverlay();
          },
          inputDecoration: widget.inputDecoration ??
              InputDecorationWithBorder(
                filledColor: AppColors.get.lighterGrey,
                enableBorderColor: AppColors.get.white,
                enableBorderRadius: 12,
                enableBorderWidth: 1,
              ),
          hint: TFFHint(
            title: widget.hint,
            fontSize: 15,
          ),
          prefix: widget.prefix ??
              PrefixWithIconData(
                iconData: widget.prefixIcon,
                color: AppColors.get.tTFPrefixColor,
                size: 25,
                scale: 1,
              ),
          suffix: widget.suffix ??
              SuffixWithIconData(
                iconData: Icons.arrow_drop_down,
                color: AppColors.get.tTFPrefixColor,
                size: 25,
                scale: 3,
              ),
        ),
      ),
    );
  }
}
