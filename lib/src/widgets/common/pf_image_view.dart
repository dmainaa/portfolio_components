

import 'dart:io';

import 'package:flutter/material.dart';

enum PFImageSourceType {
  network,
  asset,
  file,
}

class PFImageView extends StatelessWidget {
  final String path;
  final PFImageSourceType source;
  final double? width;
  final double? height;
  final BoxFit fit;

  const PFImageView({
    super.key,
    required this.path,
    required this.source,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    switch (source) {
      case PFImageSourceType.network:
        return Image.network(
          path,
          width: double.infinity,
          height: height,
          fit: fit,
          errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
        );

      case PFImageSourceType.asset:
        return Image.asset(
          path,
          width: width,
          height: height,
          fit: fit,
        );

      case PFImageSourceType.file:
        return Image.file(
          File(path),
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
        );
    }
  }
}
