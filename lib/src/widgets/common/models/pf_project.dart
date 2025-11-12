import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PFProject {
  final String title;
  final String simpleDesc;
  final String description;
  final String imageUrl;
  final String? imageBanner;
  final List<ProjectLink>? projectLinks;
  final String mainStack;
  final List<String>? teckStack;
  final List<TechTag>? techTags;

  PFProject({
    required this.title,
    required this.simpleDesc,
    required this.description,
    required this.imageUrl,
    this.imageBanner,
    this.projectLinks,
    required this.teckStack,
    required this.techTags,
    required this.mainStack,
  });
}

class ProjectLink {
  final String url;
  final ProjectLinkType type;

  ProjectLink({
    required this.url,
    required this.type,
  });

  String get name {
    switch (type) {
      case ProjectLinkType.github:
        return 'GitHub';
      case ProjectLinkType.playStore:
        return 'Play Store';
      case ProjectLinkType.appStore:
        return 'App Store';
      case ProjectLinkType.website:
        return 'Website';
      case ProjectLinkType.other:
        return 'Link';
    }
  }

  IconData get icon {
    switch (type) {
      case ProjectLinkType.github:
        return LucideIcons.github;
      case ProjectLinkType.playStore:
        return Icons.shop;
      case ProjectLinkType.appStore:
        return LucideIcons.apple;
      case ProjectLinkType.website:
        return Icons.language;
      case ProjectLinkType.other:
        return Icons.link;
    }
  }
}

enum ProjectLinkType {
  github,
  playStore,
  appStore,
  website,
  other,
}

class TechTag {
  String name;
  IconData icon;
  String? link;

  TechTag({required this.name, required this.icon, this.link});
}
