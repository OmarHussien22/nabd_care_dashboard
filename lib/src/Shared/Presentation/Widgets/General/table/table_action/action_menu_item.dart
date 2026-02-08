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

class _ActionMenuItemState extends State<ActionMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final itemColor = widget.color ?? theme.colorScheme.onSurface;
    final hoverColor =
        widget.color?.withOpacity(0.1) ??
        theme.colorScheme.primary.withOpacity(0.08);

    return Tooltip(
      message: widget.tooltip ?? widget.label,
      waitDuration: const Duration(milliseconds: 300),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: _isHovered ? hoverColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: widget.onTap,
            child: AnimatedScale(
              scale: _isHovered ? 1.03 : 1.0,
              duration: const Duration(milliseconds: 150),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(widget.icon, size: 18, color: itemColor),
                  const SizedBox(width: 8),
                  Text(
                    widget.label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: itemColor,
                      fontWeight:
                          _isHovered ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
