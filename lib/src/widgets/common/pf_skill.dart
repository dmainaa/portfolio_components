

import 'package:flutter/widgets.dart';
import 'package:portfolio_components/portfolio_components.dart';
import 'package:portfolio_components/src/widgets/common/pf_skill_level.dart';

class PFSkill extends StatelessWidget {
  final String title;
  final double percentage;
  final bool isStarred;

  const PFSkill({
    super.key,
    required this.title,
    required this.percentage,
    this.isStarred = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PFAppSize.s4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PFText(
                  title,
                  textColor: PFAppColors.defaultTextColor,
                 
                  fontSize: 14,
                ),
                const PFSpacer(size: PFAppSize.s10,),
                PFSkillLevel(percentage: percentage),
              ],
            ),
          ),
          PFText(
            "${(percentage * 100).toStringAsFixed(0)}%",
            style: PFAppTypography.regular.copyWith(
              color: PFAppColors.defaultTextColor,
            ),
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
