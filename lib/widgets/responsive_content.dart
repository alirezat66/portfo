import 'package:flutter/material.dart';

class ResponsiveContent extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const ResponsiveContent({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints and max widths
    final ResponsiveConfig config = _getResponsiveConfig(screenWidth);

    return Center(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: config.maxWidth,
        ),
        padding: padding ?? config.defaultPadding,
        child: child,
      ),
    );
  }

  ResponsiveConfig _getResponsiveConfig(double screenWidth) {
    if (screenWidth >= 1440) {
      // Big screens (1440px+) - Stop growing, maintain max width
      return ResponsiveConfig(
        breakpoint: ResponsiveBreakpoint.bigScreen,
        maxWidth: 1400, // Max content width
        defaultPadding:
            const EdgeInsets.symmetric(horizontal: 60, vertical: 24),
      );
    } else if (screenWidth >= 1024) {
      // Desktop (1024px - 1439px)
      return ResponsiveConfig(
        breakpoint: ResponsiveBreakpoint.desktop,
        maxWidth: screenWidth * 0.9, // 90% of screen width
        defaultPadding:
            const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
      );
    } else if (screenWidth >= 768) {
      // Tablet (768px - 1023px)
      return ResponsiveConfig(
        breakpoint: ResponsiveBreakpoint.tablet,
        maxWidth: screenWidth * 0.95, // 95% of screen width
        defaultPadding:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      );
    } else {
      // Mobile (< 768px)
      return ResponsiveConfig(
        breakpoint: ResponsiveBreakpoint.mobile,
        maxWidth: screenWidth, // Full width
        defaultPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      );
    }
  }
}

enum ResponsiveBreakpoint {
  mobile, // < 768px
  tablet, // 768px - 1023px
  desktop, // 1024px - 1439px
  bigScreen, // 1440px+
}

class ResponsiveConfig {
  final ResponsiveBreakpoint breakpoint;
  final double maxWidth;
  final EdgeInsets defaultPadding;

  const ResponsiveConfig({
    required this.breakpoint,
    required this.maxWidth,
    required this.defaultPadding,
  });
}

// Extension to get current breakpoint anywhere
extension ResponsiveExtension on BuildContext {
  ResponsiveBreakpoint get breakpoint {
    final screenWidth = MediaQuery.of(this).size.width;
    if (screenWidth >= 1440) return ResponsiveBreakpoint.bigScreen;
    if (screenWidth >= 1024) return ResponsiveBreakpoint.desktop;
    if (screenWidth >= 768) return ResponsiveBreakpoint.tablet;
    return ResponsiveBreakpoint.mobile;
  }

  bool get isMobile => breakpoint == ResponsiveBreakpoint.mobile;
  bool get isTablet => breakpoint == ResponsiveBreakpoint.tablet;
  bool get isDesktop => breakpoint == ResponsiveBreakpoint.desktop;
  bool get isBigScreen => breakpoint == ResponsiveBreakpoint.bigScreen;
}
