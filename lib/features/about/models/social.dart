// Temporary compatibility model for Social
// This will be removed once all references are updated to use the new data structure

class Social {
  final String icon;
  final String url;
  final String tooltip;

  Social({required this.icon, required this.url, required this.tooltip});

  factory Social.linkedIn() {
    return Social(
        icon: 'assets/icons/linkedin.svg',
        url: 'https://www.linkedin.com/in/alirezat66/',
        tooltip: 'LinkedIn');
  }

  factory Social.youtube() {
    return Social(
        icon: 'assets/icons/youtube.svg',
        url: 'https://www.youtube.com/@taghiTechTalks',
        tooltip: 'YouTube');
  }

  factory Social.medium() {
    return Social(
        icon: 'assets/icons/medium.svg',
        url: 'https://medium.com/@alirezataghizadeh66',
        tooltip: 'Medium');
  }

  factory Social.github() {
    return Social(
        icon: 'assets/icons/github.svg',
        url: 'https://github.com/alirezat66',
        tooltip: 'GitHub');
  }

  factory Social.telegram() {
    return Social(
        icon: 'assets/icons/telegram.svg',
        url: 'https://t.me/alirezat_66',
        tooltip: 'Telegram');
  }
}
