import 'package:flutter/widgets.dart';

class PFLink {
  final String title;
  final VoidCallback onTap;
  final Widget? icon;

  const PFLink({
    required this.title,
    required this.onTap,
    this.icon,
  });
}
