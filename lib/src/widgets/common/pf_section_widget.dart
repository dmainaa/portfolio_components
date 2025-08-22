import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_size.dart';
import '../text/pf_text.dart' show PFText;
import 'pf_spacer.dart';

class PFSectionWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const PFSectionWidget({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        PFSectionTitleWidget(title: title),
        PFSpacer(),
        // Content
        child,
      ],
    );
  }
}

class PFSectionTitleWidget extends StatelessWidget {
  const PFSectionTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          PFText(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: PFAppSize.s20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const PFSpacer(size: PFAppSize.s10),
    
          // Divider under title
          Container(
            height: PFAppSize.s4,
            width: PFAppSize.s100,
            color: PFAppColors.primary,
          ),
        ],
      ),
    );
  }
}
