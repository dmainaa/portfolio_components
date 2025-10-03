import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';
import 'package:portfolio_components/src/theme/app_colors.dart';

class BaseCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BoxConstraints constraints;

  const BaseCard({
    super.key,
    this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(8),
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  constraints.maxWidth < 600
            ? constraints.maxWidth
            : constraints.maxWidth * 0.3,   
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: PFAppColors.primary),
        borderRadius: BorderRadius.circular(PFAppSize.s12),
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
