part of 'imports_text_field.dart';

class CustomDropdownField<T> extends StatefulWidget {
  final String label;
  final String hint;
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validation;
  final bool enabled;
  final bool enableSearch;
  final String Function(T)? itemLabel;
  final double? width;
  final EdgeInsets surroundingPadding;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    this.value,
    this.onChanged,
    this.validation,
    this.enabled = true,
    this.enableSearch = false,
    this.itemLabel,
    this.width,
    this.surroundingPadding = EdgeInsets.zero,
  });

  @override
  State<CustomDropdownField<T>> createState() => _CustomDropdownFieldState<T>();
}

class _CustomDropdownFieldState<T> extends State<CustomDropdownField<T>>
    with SingleTickerProviderStateMixin {

  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  OverlayEntry? _overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<T> _filteredItems = [];

  String _labelOf(T item) => widget.itemLabel?.call(item) ?? item.toString();

  bool get _isOpen => _overlayEntry != null;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && widget.enableSearch) {
        _showOverlay();
      }
      if (!_focusNode.hasFocus) {
        _hideOverlay();
      }
    });
    _syncController();
  }

  @override
  void didUpdateWidget(covariant CustomDropdownField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _filteredItems = widget.items;
    }
    if (oldWidget.value != widget.value) {
      _syncController();
    }
  }

  void _syncController() {
    final value = widget.value;
    if (value == null) {
      _controller.text = '';
    } else {
      _controller.text = _labelOf(value);
    }
  }

  void _toggleOverlay() {
    if (!widget.enabled) return;
    if (_isOpen) {
      _hideOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final availableHeight =
        MediaQuery.sizeOf(context).height - offset.dy - size.height;
    const dropdownMaxHeight = 260.0;
    final showAtTop = availableHeight < dropdownMaxHeight + 10;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            targetAnchor: showAtTop ? Alignment.topLeft : Alignment.bottomLeft,
            followerAnchor:
                showAtTop ? Alignment.bottomLeft : Alignment.topLeft,
            offset: Offset(0, showAtTop ? -6 : 6),
            child: TapRegion(
              groupId: _layerLink,
              onTapOutside: (_) => _hideOverlay(),
              child: FadeTransition(
                opacity: _animation,
                child: SizeTransition(
                  sizeFactor: _animation,
                  axisAlignment: -1,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: dropdownMaxHeight),
                      decoration: BoxDecoration(
                        color: AppColors.get.surface,
                        borderRadius: BorderRadius.circular(12.toRad()),
                        border: Border.all(color: AppColors.get.border),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!widget.enableSearch)
                            Divider(height: 1, color: AppColors.get.border),
                          Flexible(
                            child: _filteredItems.isEmpty
                                ? Padding(
                                    padding: EdgeInsets.all(16.toW()),
                                    child: Text(
                                      'No results',
                                      style: TextStyle(
                                        color: AppColors.get.textSecondary,
                                      ),
                                    ),
                                  )
                                : ListView.separated(
                                    padding: EdgeInsets.zero,
                                    itemCount: _filteredItems.length,
                                    separatorBuilder: (_, __) => Divider(
                                      height: 1,
                                      color: AppColors.get.border,
                                    ),
                                    itemBuilder: (context, index) {
                                      final item = _filteredItems[index];
                                      final selected = widget.value != null &&
                                          _labelOf(item) ==
                                              _labelOf(widget.value as T);
                                      return InkWell(
                                        onTap: () => _selectItem(item),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16.toW(),
                                            vertical: 12.toH(),
                                          ),
                                          color: selected
                                              ? AppColors.get.primary
                                                  .withOpacity(0.1)
                                              : Colors.transparent,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  _labelOf(item),
                                                  style: TextStyle(
                                                    color: selected
                                                        ? AppColors.get.primary
                                                        : AppColors
                                                            .get.textPrimary,
                                                    fontWeight: selected
                                                        ? FontWeight.w600
                                                        : FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              if (selected)
                                                Icon(Icons.check,
                                                    size: 18.toW(),
                                                    color:
                                                        AppColors.get.primary),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  void _hideOverlay() {
    if (_overlayEntry == null) return;
    _animationController.reverse().whenComplete(() {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = query.isEmpty
          ? widget.items
          : widget.items
              .where((item) =>
                  _labelOf(item).toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
    if (!_isOpen) {
      _showOverlay();
    }
    _overlayEntry?.markNeedsBuild();
  }


  void _selectItem(T item) {
    _controller.text = _labelOf(item);
    widget.onChanged?.call(item);
    _filteredItems = widget.items;
    _hideOverlay();
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TapRegion(
        groupId: _layerLink,
        onTapOutside: (_) => _hideOverlay(),
        child: TextFieldDefault(
          width: widget.width,
          controller: _controller,
          focusNode: _focusNode,
          readOnly: !widget.enableSearch,
          enable: widget.enabled,
          onTap: _toggleOverlay,
          onChanged: widget.enableSearch ? _filterItems : null,
          validation: (value) {
            if (widget.validation == null) return null;
            return widget.validation!(widget.value);
          },
          header:widget.label .isNotEmpty? TFFHeader(title: widget.label): TFFNone(),
          hint: TFFHint(title: widget.hint),
          suffix: SuffixWithIconData(
            iconData: _isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: AppColors.get.textSecondary,
            size: 24,
            scale: 1,
          ),
        ),
      ),
    );
  }
}
