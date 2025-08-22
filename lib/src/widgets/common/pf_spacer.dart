import 'package:flutter/material.dart';
import '../../theme/app_size.dart' show PFAppSize;

class PFSpacer extends StatelessWidget {
  final double size;
  final bool vertical;

  const PFSpacer({
    super.key,
    this.size = PFAppSize.s20,
    this.vertical = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: vertical ? 0 : size,
      height: vertical ? size : 0,
    );
  }
}
