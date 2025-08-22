import 'package:flutter/material.dart';

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

    int crossAxisCount;
    if (width >= 1024) {
      crossAxisCount = 3; // Desktop/Web
    } else if (width >= 600) {
      crossAxisCount = 2; // Tablet
    } else {
      crossAxisCount = 1; // Mobile
    }

    return SizedBox(
      height: 500,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: children.length,
        itemBuilder: (_, index) => children[index],
      ),
    );
  }
}
