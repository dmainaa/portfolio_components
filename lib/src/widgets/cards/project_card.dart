import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';
import 'package:portfolio_components/src/theme/app_size.dart';
import 'package:portfolio_components/src/widgets/cards/base_card.dart';
import 'package:portfolio_components/src/widgets/common/models/pf_badge.dart';
import 'package:portfolio_components/src/widgets/common/models/pf_project.dart';
import 'package:portfolio_components/src/widgets/common/pf_spacer.dart';
import 'package:url_launcher/url_launcher.dart';

class PFProjectCard extends BaseCard {
  final PFProject project;
  final BoxConstraints constraints;

  const PFProjectCard({super.key, required this.project, required this.constraints})
    : super(constraints: constraints);

  @override
  EdgeInsetsGeometry get padding => const EdgeInsets.all(0);

  @override
  Widget get child => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Image View
        Container(
          height: constraints.maxHeight * 0.6,
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
        const PFSpacer(size: PFAppSize.s16),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PFAppSize.s16,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: PFText(
                      project.title,
                      style: PFAppTypography.bold.copyWith(
                        fontSize: PFAppSize.s16,
                        color: PFAppColors.defaultTextColor,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  PFBadge(title: project.title),
                ],
              ),
              const PFSpacer(size: PFAppSize.s8),
              PFText(
                project.simpleDesc,
                style: PFAppTypography.regular.copyWith(
                  fontSize: PFAppSize.s12,
                  color: PFAppColors.defaultTextColor,
                ),
                maxLines: 3,
              ),
              const PFSpacer(size: PFAppSize.s12),
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
                const PFSpacer(size: PFAppSize.s12),
                Padding(
                  padding: const EdgeInsets.only(bottom: PFAppSize.s8),
                  child: Row(
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
                ),
              ],
            ],
          ),
        ),
      ],
    ),
  );

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      debugPrint('Could not launch $url: $e');
    }
  }
}
