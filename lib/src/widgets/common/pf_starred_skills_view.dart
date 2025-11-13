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

    final crossAxisCount = PFResponsiveUtils.getGridColumns(width);
    final childAspectRatio = PFResponsiveUtils.getSkillCardAspectRatio(width);

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
        mainAxisSpacing: 16,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: starredSkills.length,
      itemBuilder: (_, index) => _StarredSkillCard(
        skill: starredSkills[index],
        width: width,
      ),
    );
  }
}

class _StarredSkillCard extends StatelessWidget {
  final PFSkill skill;
  final double width;

  const _StarredSkillCard({required this.skill, required this.width});

  @override
  Widget build(BuildContext context) {
    // Calculate star rating (1-5 stars based on percentage)
    final starCount = (skill.percentage * 5).round();

    // Responsive sizing using utility with grid density scaling
    final iconSize = PFResponsiveUtils.getResponsiveIconSizeScaled(
      width,
      mobile: 20,
      tablet: 22,
      desktop: 24,
      largeDesktop: 26,
      ultraWide: 28,
    );
    final titleFontSize = PFResponsiveUtils.getResponsiveFontSizeScaled(
      width,
      mobile: PFAppSize.s14,
      tablet: PFAppSize.s16,
      desktop: PFAppSize.s16,
      largeDesktop: PFAppSize.s20,
      ultraWide: PFAppSize.s24,
    );
    final percentageFontSize = PFResponsiveUtils.getResponsiveFontSizeScaled(
      width,
      mobile: PFAppSize.s12,
      tablet: PFAppSize.s14,
      desktop: PFAppSize.s14,
      largeDesktop: PFAppSize.s16,
      ultraWide: PFAppSize.s20,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PFAppSize.s8, vertical: PFAppSize.s4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Skill Title
          Flexible(
            child: PFText(
              skill.title,
              style: PFAppTypography.bold.copyWith(
                fontSize: titleFontSize,
                color: PFAppColors.accent,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: PFAppSize.s8),

          // Star Rating
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                5,
                (index) => Icon(
                  index < starCount ? Icons.star : Icons.star_border,
                  color: PFAppColors.accent,
                  size: iconSize,
                ),
              ),
            ),
          ),

          const SizedBox(height: PFAppSize.s4),

          // Percentage
          PFText(
            "${(skill.percentage * 100).toStringAsFixed(0)}%",
            style: PFAppTypography.regular.copyWith(
              fontSize: percentageFontSize,
              color: PFAppColors.defaultTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
