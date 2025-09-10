import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';

class CompanyWidget extends StatefulWidget {
  final String name;
  final String logo;
  final String url;

  const CompanyWidget({
    super.key,
    required this.name,
    required this.logo,
    required this.url,
  });

  @override
  State<CompanyWidget> createState() => _CompanyWidgetState();
}

class _CompanyWidgetState extends State<CompanyWidget>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _colorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });

    if (isHovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            child: GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(widget.url));
              },
              child: Row(
                spacing: 12,
                children: [
                  AnimatedBuilder(
                    animation: _colorAnimation,
                    builder: (context, child) {
                      return _isHovered
                          ? CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(widget.logo),
                              backgroundColor: Colors.transparent,
                            )
                          : ColorFiltered(
                              colorFilter: ColorFilter.matrix([
                                0.2126 + (1 - 0.2126) * _colorAnimation.value,
                                0.7152 + (1 - 0.7152) * _colorAnimation.value,
                                0.0722 + (1 - 0.0722) * _colorAnimation.value,
                                0, 0, // Red channel
                                0.2126 + (1 - 0.2126) * _colorAnimation.value,
                                0.7152 + (1 - 0.7152) * _colorAnimation.value,
                                0.0722 + (1 - 0.0722) * _colorAnimation.value,
                                0, 0, // Green channel
                                0.2126 + (1 - 0.2126) * _colorAnimation.value,
                                0.7152 + (1 - 0.7152) * _colorAnimation.value,
                                0.0722 + (1 - 0.0722) * _colorAnimation.value,
                                0, 0, // Blue channel
                                0, 0, 0, 1, 0, // Alpha channel
                              ]),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(widget.logo),
                                backgroundColor: Colors.transparent,
                              ),
                            );
                    },
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: _isHovered
                          ? [
                              context.basicColors.surfaceBrandColor, // Amber
                              context.basicColors
                                  .surfaceBrandSecondary, // Darker amber
                            ]
                          : [
                              context.basicColors.textSecondaryColor, // Gray
                              context
                                  .basicColors.textTertiaryColor, // Light gray
                            ],
                    ).createShader(bounds),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: context.basicColors
                            .textPrimaryColor, // This will be masked by the gradient
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
