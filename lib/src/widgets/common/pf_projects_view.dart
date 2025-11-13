import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';

/// A responsive grid view for displaying projects
class PFProjectsView extends StatelessWidget {
  final List<Widget> children;

  const PFProjectsView({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final crossAxisCount = PFResponsiveUtils.getGridColumns(width);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,

      ),
      itemCount: children.length,
      itemBuilder: (_, index) => children[index],
    );
  }
}
