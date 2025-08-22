import 'package:flutter/material.dart';
import 'package:portfolio_components/src/theme/app_size.dart';
import 'package:portfolio_components/src/widgets/cards/base_card.dart';
import 'package:portfolio_components/src/widgets/common/models/pf_badge.dart';
import 'package:portfolio_components/src/widgets/common/models/pf_project.dart';
import 'package:portfolio_components/src/widgets/common/pf_image_view.dart';
import 'package:portfolio_components/src/widgets/common/pf_spacer.dart';

class PFProjectCard extends BaseCard {
  final PFProject project;

  const PFProjectCard({super.key, required this.project});

  @override
  EdgeInsetsGeometry get padding => const EdgeInsets.all(0);

  @override
  Widget get child => Column(
    children: [
      //Image View
      Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(PFAppSize.s12),
          topRight: Radius.circular(PFAppSize.s12)
        ),
        
        
       
      ), child: PFImageView(path: project.imageUrl, source: PFImageSourceType.network)),
      PFSpacer(size: PFAppSize.s4),
      Row(
        children: [
          Expanded(
            child: Text(
              project.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          PFBadge(title: project.title),
        ],
      ),
      PFSpacer(size: PFAppSize.s2),
    ],
  );
}
