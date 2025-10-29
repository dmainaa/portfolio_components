class PFResume {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String location;
  final String website;
  final String summary;
  final List<PFWorkExperience> workExperience;
  final List<PFEducation> education;
  final List<String> skills;

  const PFResume({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.location,
    required this.website,
    required this.summary,
    required this.workExperience,
    required this.education,
    required this.skills,
  });
}

class PFWorkExperience {
  final String position;
  final String company;
  final String period;
  final String description;
  final List<String> achievements;

  const PFWorkExperience({
    required this.position,
    required this.company,
    required this.period,
    required this.description,
    required this.achievements,
  });
}

class PFEducation {
  final String degree;
  final String institution;
  final String period;
  final String? description;

  const PFEducation({
    required this.degree,
    required this.institution,
    required this.period,
    this.description,
  });
}
