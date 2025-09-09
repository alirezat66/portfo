import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/core/view/widgets/glow_card.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/widgets/responsive_content.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      onTap: () => launchUrl(Uri.parse(article.url)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image
            Container(
              width: double.infinity,
              height: context.isMobile ? 180 : 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: context.basicColors.surfaceBrandColor.withValues(alpha: 0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: const Color(0xFF1A1A1A),
                  child: Center(
                    child: _buildArticleIcon(article.category),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Category and Read Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color:
                        context.basicColors.surfaceBrandColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    article.category,
                    style: TextStyle(
                      color: context.basicColors.surfaceBrandColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: context.basicColors.textSecondaryColor
                          .withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      article.readTime,
                      style: TextStyle(
                        color: context.basicColors.textSecondaryColor
                            .withValues(alpha: 0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Article Title
            Text(
              article.title,
              style: TextStyle(
                color: context.basicColors.textSecondaryColor,
                fontSize: context.isMobile ? 18 : 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 8),

            // Article Description
            SizedBox(
              height: 60, // Fixed height for consistent card sizes
              child: Text(
                article.description,
                style: TextStyle(
                  color:
                      context.basicColors.textSecondaryColor.withValues(alpha: 0.8),
                  fontSize: context.isMobile ? 14 : 15,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 16),

            // Read More Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.basicColors.surfaceBrandColor
                          .withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Read More',
                        style: TextStyle(
                          color: context.basicColors.textSecondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_outward,
                        size: 14,
                        color: context.basicColors.textSecondaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleIcon(String category) {
    IconData icon;
    Color color;

    switch (category.toLowerCase()) {
      case 'next.js':
        icon = Icons.web;
        color = Colors.white;
        break;
      case 'react':
        icon = Icons.refresh;
        color = const Color(0xFF61DAFB);
        break;
      case 'tailwindcss':
        icon = Icons.style;
        color = const Color(0xFF06B6D4);
        break;
      case 'flutter':
        icon = Icons.flutter_dash;
        color = const Color(0xFF02569B);
        break;
      case 'typescript':
        icon = Icons.code;
        color = const Color(0xFF3178C6);
        break;
      default:
        icon = Icons.article;
        color = Colors.grey;
    }

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 40,
        color: color,
      ),
    );
  }
}
