import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isOutlined = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              gradient: widget.isOutlined
                  ? null
                  : (_isHovered
                      ? AppColors.primaryGradient
                      : AppColors.buttonGradient),
              color: widget.isOutlined
                  ? (_isHovered ? AppColors.primary.withOpacity(0.15) : Colors.transparent)
                  : null,
              borderRadius: BorderRadius.circular(12),
              border: widget.isOutlined
                  ? Border.all(
                      color: _isHovered ? AppColors.secondary : AppColors.primary,
                      width: 2,
                    )
                  : null,
              boxShadow: widget.isOutlined || !_isHovered
                  ? []
                  : [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    size: 18,
                    color: AppColors.textPrimary,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.text,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
