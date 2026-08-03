import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Animation Component #4: Animated Nav Button with Size Bar expansion & Color transition text.
class AnimatedNavButton extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const AnimatedNavButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<AnimatedNavButton> createState() => _AnimatedNavButtonState();
}

class _AnimatedNavButtonState extends State<AnimatedNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final activeOrHover = widget.isActive || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: activeOrHover ? FontWeight.bold : FontWeight.w500,
                  color: activeOrHover
                      ? AppColors.secondary
                      : AppColors.textSecondary,
                ),
                child: Text(widget.title),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                height: 3,
                width: activeOrHover ? 24 : 0,
                decoration: BoxDecoration(
                  color: activeOrHover ? AppColors.secondary : Colors.transparent,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: activeOrHover
                      ? [
                          BoxShadow(
                            color: AppColors.secondary.withOpacity(0.6),
                            blurRadius: 6,
                          )
                        ]
                      : [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
