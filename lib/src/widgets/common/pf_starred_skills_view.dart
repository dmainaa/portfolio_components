import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';

/// A responsive row view for displaying starred skills with star ratings
class PFStarredSkillsView extends StatelessWidget {
  final List<PFSkill> skills;

  const PFStarredSkillsView({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (width >= 1024) {
      crossAxisCount = 3; // Desktop/Web - 3 columns
    } else if (width >= 600) {
      crossAxisCount = 2; // Tablet - 2 columns
    } else {
      crossAxisCount = 1; // Mobile - 1 column
    }

    // Filter only starred skills and limit to max 5
    final starredSkills = skills.where((skill) => skill.isStarred).take(5).toList();

    if (starredSkills.isEmpty) {
      return const SizedBox.shrink();
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 0,
        childAspectRatio: 3,
      ),
      itemCount: starredSkills.length,
      itemBuilder: (_, index) => _StarredSkillCard(
        skill: starredSkills[index],
      ),
    );
  }
}

class _StarredSkillCard extends StatelessWidget {
  final PFSkill skill;

  const _StarredSkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    // Calculate star rating (1-5 stars based on percentage)
    final starCount = (skill.percentage * 5).round();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PFAppSize.s8, vertical: PFAppSize.s4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Skill Title
          PFText(
            skill.title,
            style: PFAppTypography.bold.copyWith(
              fontSize: PFAppSize.s16,
              color: PFAppColors.accent,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const PFSpacer(size: PFAppSize.s12),

          // Star Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(
                index < starCount ? Icons.star : Icons.star_border,
                color: PFAppColors.accent,
                size: 24,
              ),
            ),
          ),

          const PFSpacer(size: PFAppSize.s8),

          // Percentage
          PFText(
            "${(skill.percentage * 100).toStringAsFixed(0)}%",
            style: PFAppTypography.regular.copyWith(
              fontSize: PFAppSize.s14,
              color: PFAppColors.defaultTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
