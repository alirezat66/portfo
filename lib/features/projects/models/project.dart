import 'package:portfolio/core/gen/assets.gen.dart';

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

  static List<Project> get sampleProjects => [
        Project(
          id: '1',
          title: 'Tuktoro',
          description: 'A haptic and digital toy to enjoy math',
          imageUrl: 'images/works/tuktoro/tuktoro_main.jpg',
          tags: ['UI/UX'],
          projectUrl: 'https://tuktoro.com/',
        ),
        Project(
          id: '2',
          title: 'Moebel',
          description: 'A comparison portal for furniture products',
          imageUrl: Assets.images.works.moebel.moebelMain.path,
          tags: ['Front End', 'Back End'],
          projectUrl: 'https://moebel.de',
        ),
        Project(
          id: '3',
          title: 'Loyalmate',
          description: 'Smart loyalty platform, with smart cards',
          imageUrl: Assets.images.works.loyalmate.loyalmateMain.path,
          tags: ['Front End'],
          projectUrl: 'https://loyalmate.app/',
        ),
        Project(
          id: '4',
          title: 'Fydez',
          description: 'App generator platform for Shopify stores',
          imageUrl: Assets.images.works.fydez.fydezMain.path,
          tags: ['Back End'],
          projectUrl: 'https://www.fydez.com/',
        ),
        Project(
          id: '5',
          title: 'Remote Derm',
          description: 'A platform for remote dermatology consultations',
          imageUrl: Assets.images.works.remotederm.remotedermMain.path,
          tags: ['Front End'],
          projectUrl: 'https://www.remotederm.ca/',
        ),
        Project(
          id: '6',
          title: 'Oraclium',
          description: 'Daily horoscopes, birth charts, and more.',
          imageUrl: Assets.images.works.oraclium.oracliumMain.path,
          tags: ['Front End'],
          projectUrl: 'https://www.oraclium.com/',
        ),
      ];
}
