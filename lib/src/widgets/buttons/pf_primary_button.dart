import 'package:flutter/material.dart';
import '../../theme/app_colors.dart' show PFAppColors;
import '../../theme/app_size.dart' show PFAppSize;
import '../../theme/app_typography.dart' show PFAppTypography;
import '../text/pf_text.dart';

class PFPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? borderRadius;
  final Widget? icon;

  const PFPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? PFAppColors.primary,
          foregroundColor: textColor ?? Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: PFAppSize.s20,
            vertical: PFAppSize.s12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? PFAppSize.s50, // Full stadium by default
            ),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: PFAppSize.s1,
            ),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PFAppSize.s20,
            vertical: PFAppSize.s12,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[icon!, const SizedBox(width: PFAppSize.s8)],
              PFText(
                label,
                style: PFAppTypography.semiBold.copyWith(
                  color: textColor ?? Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
