import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';
import 'package:portfolio_components/src/theme/app_size.dart';
import 'package:portfolio_components/src/widgets/cards/base_card.dart';
import 'package:portfolio_components/src/widgets/common/models/pf_badge.dart';
import 'package:portfolio_components/src/widgets/common/models/pf_project.dart';
import 'package:url_launcher/url_launcher.dart';

class PFProjectCard extends BaseCard {
  final PFProject project;
  final BoxConstraints constraints;

  const PFProjectCard({
    super.key,
    required this.project,
    required this.constraints,
  }) : super(constraints: constraints);

  @override
  EdgeInsetsGeometry get padding => const EdgeInsets.all(0);

  @override
  Widget get child {
    // Calculate screenWidth from constraints
    final screenWidth = constraints.maxWidth * PFResponsiveUtils.getGridColumns(constraints.maxWidth);

    // Get scaled font sizes based on grid density
    final titleFontSize = PFResponsiveUtils.getResponsiveFontSizeScaled(
      screenWidth,
      mobile: PFAppSize.s16,
      tablet: PFAppSize.s16,
      desktop: PFAppSize.s16,
      largeDesktop: PFAppSize.s20,
      ultraWide: PFAppSize.s20,
    );
    final descFontSize = PFResponsiveUtils.getResponsiveFontSizeScaled(
      screenWidth,
      mobile: PFAppSize.s12,
      tablet: PFAppSize.s12,
      desktop: PFAppSize.s12,
      largeDesktop: PFAppSize.s14,
      ultraWide: PFAppSize.s14,
    );
    final spacing = PFResponsiveUtils.getResponsiveSpacingScaled(
      screenWidth,
      mobile: 8,
      tablet: 8,
      desktop: 12,
      largeDesktop: 12,
      ultraWide: 16,
    );

    return Column(
      children: [
        //Image View with AspectRatio
        AspectRatio(
          aspectRatio: PFResponsiveUtils.getProjectCardAspectRatio(screenWidth),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(PFAppSize.s12),
                topRight: Radius.circular(PFAppSize.s12),
              ),
              image: DecorationImage(
                image: AssetImage(project.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(PFAppSize.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: PFText(
                        project.title,
                        style: PFAppTypography.bold.copyWith(
                          fontSize: titleFontSize,
                          color: PFAppColors.defaultTextColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: spacing),
                PFText(
                  project.simpleDesc,
                  style: PFAppTypography.regular.copyWith(
                    fontSize: descFontSize,
                    color: PFAppColors.defaultTextColor,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: spacing),
                Wrap(
                  spacing: PFAppSize.s8,
                  runSpacing: PFAppSize.s8,
                  children:
                      project.teckStack
                          ?.map(
                            (tech) => PFBadge(
                              title: tech,
                              textColor: PFAppColors.accent,
                              borderColor: PFAppColors.primary,
                            ),
                          )
                          .toList() ??
                      [],
                ),
                if (project.projectLinks != null && project.projectLinks!.isNotEmpty) ...[
                  SizedBox(height: spacing),
                  Row(
                    children: project.projectLinks!.map((link) {
                      return Padding(
                        padding: const EdgeInsets.only(right: PFAppSize.s8),
                        child: InkWell(
                          onTap: () => _launchUrl(link.url),
                          borderRadius: BorderRadius.circular(PFAppSize.s8),
                          child: Container(
                            padding: const EdgeInsets.all(PFAppSize.s8),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(PFAppSize.s8),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.5),
                              ),
                            ),
                            child: Icon(
                              link.icon,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      debugPrint('Could not launch $url: $e');
    }
  }
}
