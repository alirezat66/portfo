import 'package:portfolio/core/gen/assets.gen.dart';

class Social {
  final String icon;
  final String url;
  final String tooltip;
  Social({required this.icon, required this.url, required this.tooltip});

  factory Social.linkedIn() {
    return Social(
        icon: Assets.icons.linkedin.path,
        url: 'https://www.linkedin.com/in/alirezat66/',
        tooltip: 'LinkedIn');
  }
  factory Social.youtube() {
    return Social(
        icon: Assets.icons.youtube.path,
        url: 'https://www.youtube.com/@taghiTechTalks',
        tooltip: 'YouTube');
  }
  factory Social.medium() {
    return Social(
        icon: Assets.icons.medium.path,
        url: 'https://medium.com/@alirezataghizadeh66',
        tooltip: 'Medium');
  }
  factory Social.github() {
    return Social(
        icon: Assets.icons.github.path,
        url: 'https://github.com/alirezat66',
        tooltip: 'GitHub');
  }
  factory Social.telegram() {
    return Social(
        icon: Assets.icons.telegram.path,
        url: 'https://t.me/alirezat_66',
        tooltip: 'Telegram');
  }
}
