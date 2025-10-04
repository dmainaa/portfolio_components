import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';

class PFBadge extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double fontSize;

  const PFBadge({
    super.key,
    required this.title,
    this.textColor = PFAppColors.primary,
    this.borderColor = PFAppColors.primary,
    this.borderRadius = 12.0,
    this.backgroundColor = PFAppColors.scaffoldBackground,
    this.padding = const EdgeInsets.symmetric(horizontal: PFAppSize.s8, vertical: PFAppSize.s4),
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: PFText(
        title,
        textColor: textColor,
        fontSize: PFAppSize.s4,
        style: PFAppTypography.regular.copyWith(
          fontSize: PFAppSize.s8,
          color: textColor,
        ),
      ),
    );
  }
}
