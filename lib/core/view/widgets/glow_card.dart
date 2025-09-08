import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class GlowCard extends StatefulWidget {
  final VoidCallback? onTap;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Widget child;
  const GlowCard(
      {super.key,
      this.onTap,
      this.borderRadius,
      this.borderWidth,
      required this.child,
      this.borderColor});

  @override
  State<GlowCard> createState() => _GlowCardState();
}

class _GlowCardState extends State<GlowCard> {
  Offset _pointerPosition = Offset.zero;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Disable hover effects on mobile and tablet
    final bool enableHover = context.isDesktop || context.isLaptop;
    
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: enableHover
          ? MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isHovered = false;
                });
              },
              onHover: (event) {
                setState(() {
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  final localPosition = box.globalToLocal(event.position);
                  _pointerPosition =
                      localPosition - Offset(box.size.width / 2, box.size.height / 2);
                });
              },
              child: _buildCardContent(context, enableHover),
            )
          : _buildCardContent(context, enableHover),
    );
  }

  Widget _buildCardContent(BuildContext context, bool enableHover) {
    return Stack(
      children: [
        // Card with static border
        GestureDetector(
          onTap: () => widget.onTap?.call(),
          child: Container(
            decoration: BoxDecoration(
              color: context.basicColors.backgroundColor,
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? 16),
              border: Border.all(
                color: widget.borderColor ??
                    context.basicColors.surfaceBrandColor,
                width: widget.borderWidth ?? 3,
              ),
            ),
            child: widget.child,
          ),
        ),
        // Glow effect (only on desktop/laptop)
        if (enableHover)
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: _isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: CustomPaint(
                painter: GlowPainter(
                  pointerPosition: _pointerPosition,
                  color: context.basicColors
                      .surfaceBrandColor, // #FFFDBA72 with 45% opacity
                ),
                child: Container(),
              ),
            ),
          ),
      ],
    );
  }
}

class GlowPainter extends CustomPainter {
  final Offset pointerPosition;
  final Color color;

  GlowPainter({required this.pointerPosition, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final angle =
        math.atan2(pointerPosition.dy, pointerPosition.dx) * 180 / math.pi + 70;
    final adjustedAngle = (angle + 360) % 360;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14);

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(1, 1, size.width - 2, size.height - 2),
          const Radius.circular(14),
        ),
      );

    final shaderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..shader = SweepGradient(
        colors: [
          Colors.transparent,
          color.withOpacity(0.12), // Equivalent to #ffffff1f
          color,
          Colors.transparent,
        ],
        stops: const [0.0, 0.3, 0.7, 1.0],
        transform: GradientRotation((adjustedAngle) * math.pi / 180),
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14);

    canvas.drawPath(path, shaderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
