import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Animation Component #1: Animated Profile Image
/// - Size Animation
/// - Color Transition Animation
/// - Hover Animation
class AnimatedProfileImage extends StatefulWidget {
  const AnimatedProfileImage({super.key});

  @override
  State<AnimatedProfileImage> createState() => _AnimatedProfileImageState();
}

class _AnimatedProfileImageState extends State<AnimatedProfileImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation1;
  late Animation<Color?> _colorAnimation2;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.06,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _colorAnimation1 = ColorTween(
      begin: AppColors.secondary,
      end: AppColors.primary,
    ).animate(_controller);

    _colorAnimation2 = ColorTween(
      begin: AppColors.primaryDark,
      end: AppColors.glowCyan,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final currentColor1 =
              _colorAnimation1.value ?? AppColors.secondary;

          final currentColor2 =
              _colorAnimation2.value ?? AppColors.primary;

          final scale =
              _isHovered ? 1.08 : _scaleAnimation.value;

          return Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 300,
              height: 300,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    currentColor1,
                    currentColor2,
                    AppColors.primaryLight,
                    currentColor1,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: currentColor1.withOpacity(0.4),
                    blurRadius: _isHovered ? 25 : 15,
                    spreadRadius: _isHovered ? 4 : 2,
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background,
                ),
                child: const CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage(
                    'assets/images/forhad.jpeg',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}