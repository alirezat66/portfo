import 'package:flutter/material.dart';
import 'package:portfolio/core/view/increase_hover_ext.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyWidget extends StatelessWidget {
  final String name;
  final String logo;
  final String url;
  const CompanyWidget(
      {super.key, required this.name, required this.logo, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(url));
      },
      child: Row(
        spacing: 12,
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.matrix([
              0.2126, 0.7152, 0.0722, 0, 0, // Red channel
              0.2126, 0.7152, 0.0722, 0, 0, // Green channel
              0.2126, 0.7152, 0.0722, 0, 0, // Blue channel
              0, 0, 0, 1, 0, // Alpha channel
            ]),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(logo),
              backgroundColor: Colors.transparent,
            ),
          ),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF8A8A8A), // Dark white
                Color(0xFFF5F5F5), // Light white
              ],
            ).createShader(bounds),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white, // This will be masked by the gradient
              ),
            ),
          ),
        ],
      ),
    ).increaseSizeOnHover(1.2);
  }
}
