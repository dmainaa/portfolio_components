import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';
import 'package:portfolio_components/src/widgets/common/pf_gradient_mask.dart';
import 'pf_text.dart';

class PFGradientTitle extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final List<Color>? gradientColors;
  final double fontSize;

  const PFGradientTitle({
    super.key,
    required this.text,
    this.style,
    this.fontSize = PFAppSize.s24, // default size
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return PFGradientMask(
      colors: gradientColors ?? [PFAppColors.primary, PFAppColors.accent],
      child: PFText(
        text,
        fontSize: fontSize, // default size
        style: style,
      ),
    );
  }
}
