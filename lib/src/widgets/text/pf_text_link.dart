import 'package:flutter/material.dart';
import 'package:portfolio_components/src/theme/app_size.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'pf_text.dart';

class PFTextLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Widget? icon;
  final double fontSize;

  const PFTextLink({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.fontSize = PFAppSize.s16, // default size
  });

  @override
  State<PFTextLink> createState() => _PFTextLinkState();
}

class _PFTextLinkState extends State<PFTextLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovered ? PFAppColors.accent : Colors.white;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              IconTheme(
                data: IconThemeData(color: color, size: PFAppSize.iconMedium),
                child: widget.icon!,
              ),
              const SizedBox(width: PFAppSize.s8),
            ],
            PFText(
              widget.label,
              style: PFAppTypography.semiBold.copyWith(
                fontSize: widget.fontSize,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
