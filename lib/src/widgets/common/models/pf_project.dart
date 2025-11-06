import 'package:flutter/widgets.dart';

class PFProject {
  final String title;
  final String description;
  final String imageUrl;
  final String? imageBanner;
  final String projectUrl;
  final String mainStack;
  final List<String>? teckStack;
  final List<TechTag>? techTags;

  PFProject({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.imageBanner,
    required this.projectUrl,
    required this.teckStack,
    required this.techTags,
    required this.mainStack,
  });
}

class TechTag {
  String name;
  IconData icon;
  String? link;

  TechTag({required this.name, required this.icon, this.link});
}
