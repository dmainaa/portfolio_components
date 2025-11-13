/// Utility class for responsive design helpers
class PFResponsiveUtils {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;
  static const double ultraWideBreakpoint = 1920;

  /// Returns the number of grid columns based on screen width
  /// - Ultra-wide (≥1920px): 4 columns
  /// - Large Desktop (≥1440px): 4 columns
  /// - Desktop (≥1024px): 3 columns
  /// - Tablet (≥600px): 2 columns
  /// - Mobile (<600px): 1 column
  static int getGridColumns(double width) {
    if (width >= ultraWideBreakpoint) {
      return 4; // Ultra-wide screens - 4 columns
    } else if (width >= desktopBreakpoint) {
      return 3; // Large desktop - 4 columns
    } else if (width >= tabletBreakpoint) {
      return 3; // Desktop/Web - 3 columns
    } else if (width >= mobileBreakpoint) {
      return 2; // Tablet - 2 columns
    } else {
      return 1; // Mobile - 1 column
    }
  }

  /// Returns aspect ratio for project cards based on screen width
  /// - Ultra-wide (≥1920px): 16:9
  /// - Large Desktop (≥1440px): 16:9
  /// - Desktop (≥1024px): 16:9
  /// - Tablet (≥600px): 2:1 (more compact)
  /// - Mobile (<600px): 4:3 (taller for more content visibility)
  static double getProjectCardAspectRatio(double width) {
    if (width >= tabletBreakpoint) {
      return 16 / 9; // Wider aspect ratio for desktop and above
    } else if (width >= mobileBreakpoint) {
      return 2 / 1; // Compact aspect ratio for tablet (smaller image)
    } else {
      return 2 / 1; // Taller aspect ratio for mobile to show more content
    }
  }

  /// Returns child aspect ratio for skill cards in grid based on screen width
  /// - Ultra-wide (≥1920px): 3.5
  /// - Large Desktop (≥1440px): 3.5
  /// - Desktop (≥1024px): 3
  /// - Tablet (≥600px): 2.2 (compact, minimal bottom space)
  /// - Mobile (<600px): 4
  static double getSkillCardAspectRatio(double width) {
    if (width >= desktopBreakpoint) {
      return 3.5; // Wider cards for large screens
    } else if (width >= tabletBreakpoint) {
      return 3;
    } else if (width >= mobileBreakpoint) {
      return 2.2; // Compact for tablet
    } else {
      return 4;
    }
  }

  /// Check if screen is considered small (mobile)
  static bool isSmallScreen(double width) => width < mobileBreakpoint;

  /// Check if screen is considered medium (tablet)
  static bool isMediumScreen(double width) => width >= mobileBreakpoint && width < tabletBreakpoint;

  /// Check if screen is considered large (desktop)
  static bool isLargeScreen(double width) => width >= tabletBreakpoint && width < desktopBreakpoint;

  /// Check if screen is considered extra large (large desktop)
  static bool isExtraLargeScreen(double width) => width >= desktopBreakpoint && width < ultraWideBreakpoint;

  /// Check if screen is considered ultra-wide (external monitors)
  static bool isUltraWideScreen(double width) => width >= ultraWideBreakpoint;

  /// Get responsive font size with granular scaling within breakpoints
  static double getResponsiveFontSize(double width, {
    required double mobile,
    required double tablet,
    required double desktop,
    double? largeDesktop,
    double? ultraWide,
  }) {
    if (width >= ultraWideBreakpoint) {
      return ultraWide ?? largeDesktop ?? desktop;
    } else if (width >= desktopBreakpoint) {
      return largeDesktop ?? desktop;
    } else if (width >= tabletBreakpoint) {
      return desktop;
    } else if (width >= mobileBreakpoint) {
      // Granular scaling within tablet range (600-1023px)
      // Larger tablets get closer to desktop size, smaller ones stay at tablet size
      final tabletRange = tabletBreakpoint - mobileBreakpoint; // 424px range
      final positionInRange = width - mobileBreakpoint;
      final scaleFactor = positionInRange / tabletRange; // 0.0 to 1.0

      // Interpolate between tablet and desktop sizes
      return tablet + ((desktop - tablet) * scaleFactor * 0.5); // 50% interpolation
    } else {
      return mobile;
    }
  }

  /// Get responsive icon size
  static double getResponsiveIconSize(double width, {
    double mobile = 20,
    double tablet = 22,
    double desktop = 24,
    double? largeDesktop,
    double? ultraWide,
  }) {
    if (width >= ultraWideBreakpoint) {
      return ultraWide ?? largeDesktop ?? desktop;
    } else if (width >= desktopBreakpoint) {
      return largeDesktop ?? desktop;
    } else if (width >= tabletBreakpoint) {
      return desktop;
    } else if (width >= mobileBreakpoint) {
      // Granular scaling within tablet range (600-1023px)
      final tabletRange = tabletBreakpoint - mobileBreakpoint;
      final positionInRange = width - mobileBreakpoint;
      final scaleFactor = positionInRange / tabletRange;

      // Interpolate between tablet and desktop sizes
      return tablet + ((desktop - tablet) * scaleFactor * 0.5);
    } else {
      return mobile;
    }
  }

  /// Get responsive spacing
  static double getResponsiveSpacing(double width, {
    double mobile = 8,
    double tablet = 12,
    double desktop = 16,
    double? largeDesktop,
    double? ultraWide,
  }) {
    if (width >= ultraWideBreakpoint) {
      return ultraWide ?? largeDesktop ?? desktop;
    } else if (width >= desktopBreakpoint) {
      return largeDesktop ?? desktop;
    } else if (width >= tabletBreakpoint) {
      return desktop;
    } else if (width >= mobileBreakpoint) {
      // Granular scaling within tablet range (600-1023px)
      final tabletRange = tabletBreakpoint - mobileBreakpoint;
      final positionInRange = width - mobileBreakpoint;
      final scaleFactor = positionInRange / tabletRange;

      // Interpolate between tablet and desktop sizes
      return tablet + ((desktop - tablet) * scaleFactor * 0.5);
    } else {
      return mobile;
    }
  }

  /// Get responsive padding
  static double getResponsivePadding(double width, {
    double mobile = 16,
    double tablet = 24,
    double desktop = 32,
    double? largeDesktop,
    double? ultraWide,
  }) {
    if (width >= ultraWideBreakpoint) {
      return ultraWide ?? largeDesktop ?? desktop;
    } else if (width >= desktopBreakpoint) {
      return largeDesktop ?? desktop;
    } else if (width >= tabletBreakpoint) {
      return desktop;
    } else if (width >= mobileBreakpoint) {
      // Granular scaling within tablet range (600-1023px)
      final tabletRange = tabletBreakpoint - mobileBreakpoint;
      final positionInRange = width - mobileBreakpoint;
      final scaleFactor = positionInRange / tabletRange;

      // Interpolate between tablet and desktop sizes
      return tablet + ((desktop - tablet) * scaleFactor * 0.5);
    } else {
      return mobile;
    }
  }

  /// Get scale factor based on grid density
  /// Returns a multiplier (0.8 to 1.0) to scale down content in denser grids
  /// - 1 column: 1.0 (no scaling)
  /// - 2 columns: 0.95 (slight reduction)
  /// - 3 columns: 0.9 (moderate reduction)
  /// - 4+ columns: 0.85 (more reduction)
  static double getGridDensityScaleFactor(int columns) {
    switch (columns) {
      case 1:
        return 1.0;
      case 2:
        return 0.95;
      case 3:
        return 0.9;
      case 4:
      default:
        return 0.85;
    }
  }

  /// Get responsive font size adjusted for grid density
  static double getResponsiveFontSizeScaled(double width, {
    required double mobile,
    required double tablet,
    required double desktop,
    double? largeDesktop,
    double? ultraWide,
  }) {
    final baseSize = getResponsiveFontSize(
      width,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      ultraWide: ultraWide,
    );
    final columns = getGridColumns(width);
    final scaleFactor = getGridDensityScaleFactor(columns);
    return baseSize * scaleFactor;
  }

  /// Get responsive icon size adjusted for grid density
  static double getResponsiveIconSizeScaled(double width, {
    double mobile = 20,
    double tablet = 22,
    double desktop = 24,
    double? largeDesktop,
    double? ultraWide,
  }) {
    final baseSize = getResponsiveIconSize(
      width,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      ultraWide: ultraWide,
    );
    final columns = getGridColumns(width);
    final scaleFactor = getGridDensityScaleFactor(columns);
    return baseSize * scaleFactor;
  }

  /// Get responsive spacing adjusted for grid density
  static double getResponsiveSpacingScaled(double width, {
    double mobile = 8,
    double tablet = 12,
    double desktop = 16,
    double? largeDesktop,
    double? ultraWide,
  }) {
    final baseSpacing = getResponsiveSpacing(
      width,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
      ultraWide: ultraWide,
    );
    final columns = getGridColumns(width);
    final scaleFactor = getGridDensityScaleFactor(columns);
    return baseSpacing * scaleFactor;
  }
}
