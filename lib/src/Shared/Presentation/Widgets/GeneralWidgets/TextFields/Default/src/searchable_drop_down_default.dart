part of 'imports_text_field.dart';

class SearchableFieldDefault<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) itemLabel; // دالة لتحويل العنصر لنص يظهر في القائمة
  final Function(T)? onOptionSelected;
  final String? Function(String?)? validation;
  final String hint;
  final double? width;
  final IconData prefixIcon;
  final Decoration? sheetDecoration;
  final InputDecorationImp? inputDecoration;
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
  });

  @override
  State<SearchableFieldDefault<T>> createState() =>
      _SearchableFieldDefaultState<T>();
}

class _SearchableFieldDefaultState<T> extends State<SearchableFieldDefault<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<T> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = widget.items;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showOverlay();
      } else {
        _hideOverlay();
      }
    });
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5), // مسافة بسيطة تحت الحقل
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            color: AppColors.get.activeBackground,
            // يتبع ثيم التطبيق
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              decoration: widget.sheetDecoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.get.cardFill,
                    border: Border.all(color: AppColors.get.cardBorder),
                  ),
              child: _filteredData.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("No data found".toTr()),
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
                          hoverColor:
                              AppColors.get.primary.withValues(alpha: 0.1),
                          selectedColor: AppColors.get.primary,
                          selectedTileColor: AppColors.get.primary,
                          leading: Icon(
                            Icons.person,
                            color: AppColors.get.primary,
                            size: 20,
                          ),
                          title: CustomText(widget.itemLabel(item)),
                          onTap: () {
                            _controller.text = widget.itemLabel(item);
                            widget.onOptionSelected?.call(item);
                            _focusNode.unfocus();
                          },
                        );
                      },
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
    setState(() {
      _filteredData = widget.items
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
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFieldDefault(
        width: widget.width,
        controller: _controller,
        focusNode: _focusNode,
        onChanged: _filterData,
        validation: widget.validation,
        fillColor: AppColors.get.tTFBackGround,
        isFilled: true,
        inputDecoration: widget.inputDecoration ??
            InputDecorationWithBorder(
              filledColor: AppColors.get.tTFBackGround,
              enableBorderColor: AppColors.get.tTFBorder,
              enableBorderRadius: 12,
              enableBorderWidth: 1,
            ),
        hint: TFFHint(title: widget.hint, fontSize: 15),
        prefix: PrefixWithIconData(
          iconData: widget.prefixIcon,
          color: AppColors.get.tTFPrefixColor,
          size: 25,
          scale: 1,
        ),
      ),
    );
  }
}
