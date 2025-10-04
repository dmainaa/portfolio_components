import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';
import 'package:portfolio_components/src/theme/app_size.dart';
import 'package:portfolio_components/src/widgets/cards/base_card.dart';
import 'package:portfolio_components/src/widgets/common/models/pf_badge.dart';
import 'package:portfolio_components/src/widgets/common/models/pf_project.dart';

import 'package:portfolio_components/src/widgets/common/pf_spacer.dart';

class PFProjectCard extends BaseCard {
  final PFProject project;
  final BoxConstraints constraints;

  const PFProjectCard({super.key, required this.project, required this.constraints})
    : super(constraints: constraints);

  @override
  EdgeInsetsGeometry get padding => const EdgeInsets.all(0);

  @override
  Widget get child => Column(
    children: [
      //Image View
      Container(
        height: constraints.maxWidth * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(PFAppSize.s12),
            topRight: Radius.circular(PFAppSize.s12),
          ),
          image: DecorationImage(
            image: AssetImage(project.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      PFSpacer(size: PFAppSize.s16),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PFAppSize.s16,
            vertical: 21,
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
                    ),
                  ),
                  PFBadge(title: project.title),
                ],
              ),
              PFSpacer(size: PFAppSize.s2),
              PFText(
                project.description,
                style: PFAppTypography.regular.copyWith(
                  fontSize: PFAppSize.s12,
                  color: PFAppColors.defaultTextColor,
                ),
                maxLines: null,
              ),
              PFSpacer(size: PFAppSize.s16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children:
                    project.teckStack
                        ?.map(
                          (tech) => Padding(
                            padding: const EdgeInsets.only(right: PFAppSize.s8),
                            child: PFBadge(
                              title: tech,
                              textColor: PFAppColors.accent,
                              borderColor: PFAppColors.primary,
                            ),
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
