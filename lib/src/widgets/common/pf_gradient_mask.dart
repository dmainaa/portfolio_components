import 'package:flutter/material.dart';

class PFGradientMask extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const PFGradientMask({
    super.key,
    required this.child,
    required this.colors,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: colors,
        begin: begin,
        end: end,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: child,
    );
  }
}
