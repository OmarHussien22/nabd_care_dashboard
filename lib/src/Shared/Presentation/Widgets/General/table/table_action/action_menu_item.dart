import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter/material.dart';

class ActionMenuItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback? onTap;
  final String? tooltip;

  const ActionMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.color,
    this.onTap,
    this.tooltip,
  });

  @override
  State<ActionMenuItem> createState() => _ActionMenuItemState();
}

class _ActionMenuItemState extends State<ActionMenuItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _rotateAnimation = Tween<double>(begin: 0, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final itemColor = widget.color ?? AppColors.get.textPrimary;
    // final hoverColor = widget.color?.withOpacity(0.08) ??
    //     AppColors.get.primary.withOpacity(0.08);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            // color: _isHovered ? hoverColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotateAnimation.value,
                      child: Icon(
                        widget.icon,
                        size: 20,
                        color: _isHovered
                            ? (widget.color ?? AppColors.get.primary)
                            : itemColor,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: _isHovered
                      ? (widget.color ?? AppColors.get.primary)
                      : itemColor,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                  letterSpacing: _isHovered ? 0.5 : 0,
                ),
                child: Text(widget.label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
