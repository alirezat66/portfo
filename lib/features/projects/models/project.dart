class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;
  final String? projectUrl;
  final String? githubUrl;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
    this.projectUrl,
    this.githubUrl,
  });
}
