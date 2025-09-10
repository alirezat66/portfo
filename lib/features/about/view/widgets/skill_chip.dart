import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import '../../model/data/about_data.dart';

class SkillChip extends StatefulWidget {
  final Skill skill;

  const SkillChip({
    super.key,
    required this.skill,
  });

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _getBackgroundColor(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _getBorderColor(context),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: context.basicColors.surfaceBrandColor
                        .withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.skill.icon != null) ...[
              SvgPicture.asset(
                widget.skill.icon!,
                width: 14,
                height: 14,
                colorFilter: ColorFilter.mode(
                  _getIconColor(context),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              widget.skill.name,
              style: context.textTheme.bodySmall?.copyWith(
                color: _getTextColor(context),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    if (_isHovered) {
      return context.basicColors.surfaceBrandColor.withValues(alpha: 0.1);
    }
    return context.basicColors.backgroundColor;
  }

  Color _getBorderColor(BuildContext context) {
    if (_isHovered) {
      return context.basicColors.surfaceBrandColor;
    }
    return context.basicColors.surfaceBrandColor.withValues(alpha: 0.3);
  }

  Color _getTextColor(BuildContext context) {
    if (_isHovered) {
      return context.basicColors.textPrimaryColor;
    }
    return context.basicColors.textSecondaryColor;
  }

  Color _getIconColor(BuildContext context) {
    if (_isHovered) {
      return context.basicColors.surfaceBrandColor;
    }
    return context.basicColors.textSecondaryColor;
  }
}
