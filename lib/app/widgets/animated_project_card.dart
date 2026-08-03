import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../theme/app_colors.dart';

/// Animation Component #3: Animated Project Card with Size Expansion & Glow Color Transition.
class AnimatedProjectCard extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback onTap;

  const AnimatedProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  State<AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<AnimatedProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.04 : 1.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _isHovered
                    ? [const Color(0xFF1E3A8A), AppColors.cardBg]
                    : [AppColors.cardBg, AppColors.surface.withOpacity(0.5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: _isHovered ? AppColors.primary : AppColors.surfaceLight,
                width: _isHovered ? 2.0 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? AppColors.primary.withOpacity(0.35)
                      : Colors.black.withOpacity(0.2),
                  blurRadius: _isHovered ? 20 : 8,
                  offset: _isHovered ? const Offset(0, 8) : const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _isHovered
                            ? AppColors.secondary.withOpacity(0.2)
                            : AppColors.surfaceLight.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.folder_special_rounded,
                        color: _isHovered ? AppColors.secondary : AppColors.primaryLight,
                        size: 28,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: widget.project.githubUrl.startsWith('http')
                            ? AppColors.primary.withOpacity(0.15)
                            : Colors.orange.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.project.githubUrl.startsWith('http')
                            ? 'Open Source'
                            : 'In Development',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: widget.project.githubUrl.startsWith('http')
                              ? AppColors.primaryLight
                              : Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _isHovered ? AppColors.glowCyan : AppColors.textPrimary,
                  ),
                  child: Text(widget.project.name),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.project.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: widget.project.technologies.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        tech,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 11,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
