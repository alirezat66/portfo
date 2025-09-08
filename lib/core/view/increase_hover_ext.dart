import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/widgets/responsive_content.dart';

extension IncreaseHoverExt on Widget {
  Widget increaseSizeOnHover(
    double scaleFactor, {
    bool addBlur = false,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        // Disable hover effects on mobile and tablet
        final bool enableHover = context.isDesktop || context.isLaptop;
        
        if (!enableHover) {
          return this; // Return widget without hover effects
        }
        
        bool isHovered = false;
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHovered = false;
            });
          },
          child: AnimatedContainer(
            duration: duration,
            curve: Curves.easeInOut,
            transformAlignment: Alignment.center,
            
            transform: isHovered
                ? Matrix4.diagonal3Values(scaleFactor, scaleFactor, 1.0)
                : Matrix4.diagonal3Values(1.0, 1.0, 1.0),
            child: this,
          ),
        );
      },
    );
  }

  Widget changeWidgetOnHover(
    Widget hoverWidget, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    // Validate that this widget is either SvgPicture or Image
    assert(
      this is SvgPicture || this is Image,
      'changeAssets can only be used with SvgPicture or Image widgets. '
      'Current widget type: $runtimeType',
    );

    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHovered = false;
            });
          },
          child: AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: isHovered
                ? KeyedSubtree(
                    key: const ValueKey('hover'),
                    child: hoverWidget,
                  )
                : KeyedSubtree(
                    key: const ValueKey('normal'),
                    child: this,
                  ),
          ),
        );
      },
    );
  }
}
