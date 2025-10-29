import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';

class PFSkillsCard extends BaseCard {
  final List<PFSkill> skills;
  final String title;
  final BoxConstraints constraints;
  const PFSkillsCard({
    super.key,
    required this.skills,
    required this.constraints,
    required this.title
  }) : super(constraints: constraints);

  @override
  Widget? get child => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          [
            PFText(
              title,
              style: PFAppTypography.bold.copyWith(color: PFAppColors.accent),
            ),
            PFSpacer(size: PFAppSize.s16),
            ...skills.map((skill) => PFSkill(title: skill.title, percentage: skill.percentage)),
          ]
    ),
  );
} 