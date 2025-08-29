

import 'package:flutter/widgets.dart';
import 'package:portfolio_components/portfolio_components.dart';

class PFSkillLevel extends StatelessWidget {
  final double percentage;
  final double height;
  final double borderRadius;

  const PFSkillLevel({
    super.key,
    required this.percentage,
    this.height = PFAppSize.s12,
    this.borderRadius = PFAppSize.s8,
  }) : assert(percentage >= 0 && percentage <= 1,
            "Percentage must be between 0.0 and 1.0");

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: PFAppColors.scaffoldBackground,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: percentage,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  PFAppColors.scaffoldBackground,
                  PFAppColors.primary,
                ],
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
