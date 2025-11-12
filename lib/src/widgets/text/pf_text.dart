import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';
import 'package:portfolio_components/src/theme/app_typography.dart';

class PFText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? textColor;
  final TextOverflow? overflow;
  final double? fontSize;

  const PFText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines = 1,
    this.fontSize = PFAppSize.s14,
    this.textColor = Colors.white,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          style ??
          PFAppTypography.semiBold.copyWith(
            color: textColor,
            fontSize: fontSize,
          ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? (maxLines == null ? null : TextOverflow.ellipsis),
    );
  }
}
