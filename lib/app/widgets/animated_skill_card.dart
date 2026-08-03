import 'package:flutter/material.dart';
import '../models/skill_model.dart';
import '../theme/app_colors.dart';

/// Animation Component #2: Animated Skill Card with Size Expansion & Dynamic Color Transition.
class AnimatedSkillCard extends StatefulWidget {
  final SkillModel skill;

  const AnimatedSkillCard({
    super.key,
    required this.skill,
  });

  @override
  State<AnimatedSkillCard> createState() => _AnimatedSkillCardState();
}

class _AnimatedSkillCardState extends State<AnimatedSkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.08 : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.surface : AppColors.cardBg,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: _isHovered ? AppColors.secondary : AppColors.surfaceLight,
              width: _isHovered ? 2.0 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.secondary.withOpacity(0.3)
                    : Colors.black.withOpacity(0.1),
                blurRadius: _isHovered ? 12 : 4,
                offset: _isHovered ? const Offset(0, 6) : const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? AppColors.primary.withOpacity(0.2)
                      : AppColors.surfaceLight.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.skill.icon,
                  size: 24,
                  color: _isHovered ? AppColors.glowCyan : AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      color: _isHovered
                          ? AppColors.textPrimary
                          : AppColors.textPrimary.withOpacity(0.9),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Text(widget.skill.name),
                  ),
                  const SizedBox(height: 2),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      color: _isHovered
                          ? AppColors.secondary
                          : AppColors.textMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    child: Text(widget.skill.category),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
