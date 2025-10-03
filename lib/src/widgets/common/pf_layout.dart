import 'package:flutter/material.dart';

class PFLayout extends StatelessWidget {
  final Widget desktop;
  final Widget? tablet;
  final Widget mobile;

  const PFLayout({
    super.key,
    required this.desktop,
    this.tablet,
    required this.mobile,
  });

  static const double _desktopBreakpoint = 1024;
  static const double _tabletBreakpoint = 600;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= _desktopBreakpoint) {
      return desktop;
    } else if (width >= _tabletBreakpoint) {

      return tablet ?? desktop;
       // fallback to desktop if tablet not provided
    } else {
      return mobile;
    }
  }
}
