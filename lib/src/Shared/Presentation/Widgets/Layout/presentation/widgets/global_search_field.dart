import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Features/GlobalSearch/presentation/manager/global_search_controller.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';

class GlobalSearchField extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const GlobalSearchField({
    super.key,
    required this.items,
    this.onChanged,
  });

  @override
  State<GlobalSearchField> createState() => _GlobalSearchFieldState();
}

class _GlobalSearchFieldState extends State<GlobalSearchField> {
  final GlobalSearchController _controller = Get.put(GlobalSearchController());
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        if (_controller.query.isNotEmpty) {
          _showOverlay();
        }
      } else {
        _hideOverlay();
      }
    });
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 8.toH()),
          child: Material(
            elevation: 20,
            shadowColor: AppColors.get.shadow.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.toRad()),
            color: AppColors.get.surface,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.toRad()),
                border:
                    Border.all(color: AppColors.get.border.withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              constraints: BoxConstraints(maxHeight: 450.toH()),
              child: GetBuilder<GlobalSearchController>(
                id: 'global_search',
                builder: (cnt) {
                  if (cnt.state is DataSearchLoading) {
                    return Container(
                      height: 100.toH(),
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.get.primary,
                      ),
                    );
                  }

                  if (cnt.state is DataFailed) {
                    return Padding(
                      padding: EdgeInsets.all(20.toRad()),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline,
                              color: AppColors.get.red, size: 20),
                          10.ESW(),
                          Expanded(
                              child: CustomText(
                                  cnt.state.error?.title ?? 'Search failed')),
                        ],
                      ),
                    );
                  }

                  final categories = cnt.state.data?.categories ?? [];

                  if (cnt.query.isNotEmpty &&
                      categories.isEmpty &&
                      cnt.state is! DataInitial) {
                    return Padding(
                      padding: EdgeInsets.all(30.toRad()),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.search_off,
                              size: 40.toRad(),
                              color: AppColors.get.textDisabled),
                          10.ESH(),
                          CustomText('No results found for "${cnt.query}"',
                              color: AppColors.get.textSecondary),
                        ],
                      ),
                    );
                  }

                  if (cnt.state is DataInitial || cnt.query.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8.toH()),
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(
                                16.toW(), 12.toH(), 16.toW(), 8.toH()),
                            color: AppColors.get.background,
                            child: CustomText(
                              category.name.toUpperCase(),
                              fontWeight: FW.bold,
                              fontSize: 11,
                              color: AppColors.get.textSecondary,
                              letterSpacing: 1.2,
                            ),
                          ),
                          ...category.items
                              .map((item) => ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.toW(),
                                        vertical: 4.toH()),
                                    leading: Container(
                                      width: 40.toRad(),
                                      height: 40.toRad(),
                                      decoration: BoxDecoration(
                                        color: AppColors.get.primary
                                            .withOpacity(0.05),
                                        shape: BoxShape.circle,
                                      ),
                                      child: item.avatar != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: ImageGeneric.network(
                                                  url: item.avatar!),
                                            )
                                          : Icon(Icons.person_outline,
                                              color: AppColors.get.primary,
                                              size: 20),
                                    ),
                                    title: CustomText(item.title,
                                        fontWeight: FW.semiBold, fontSize: 14),
                                    subtitle: CustomText(item.subtitle,
                                        fontSize: 12,
                                        color: AppColors.get.textSecondary),
                                    onTap: () {
                                      _hideOverlay();
                                      _focusNode.unfocus();
                                      _textController.clear();
                                      _controller.onSearchChanged('');
                                      NavigationService.instance.go(item.route);
                                    },
                                  ))
                              .toList(),
                          if (index < categories.length - 1)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.toH()),
                              child: Divider(
                                  height: 1,
                                  color: AppColors.get.border.withOpacity(0.5)),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Padding(
        padding: EdgeInsets.only(top: 10.toH()),
        child: TextFieldDefault(
          controller: _textController,
          focusNode: _focusNode,
          hint: TFFHint(title: 'search_patients_doctors...'),
          inputDecoration: InputDecorationWithBorder(
            enableBorderRadius: 12,
            enableBorderColor: AppColors.get.border,
            focusBorderRadius: 12,
            focusBorderColor: AppColors.get.primary,
            filledColor: AppColors.get.background,
          ),
          prefix: PrefixWithIconData(
            iconData: Icons.search,
            color: AppColors.get.textSecondary,
            size: 30,
            scale: .8,
          ),
          onChanged: (value) {
            _controller.onSearchChanged(value);
            if (value.isNotEmpty) {
              _showOverlay();
            } else {
              _hideOverlay();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hideOverlay();
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }
}
