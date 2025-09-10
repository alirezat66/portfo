import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/core/view/widgets/glow_card.dart';
import 'package:portfolio/features/articles/model/data/article.dart';
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
      onTap: () => launchUrl(Uri.parse(article.source)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            // Article Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: const Color(0xFF1A1A1A),
                  child: Image.asset(
                    article.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),

            // Category and Read Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...article.tags.map((tag) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: context.basicColors.surfaceBrandColor
                                  .withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color: context.basicColors.surfaceBrandColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )),
                    ],
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
            Text(
              article.excerpt,
              style: TextStyle(
                color: context.basicColors.textSecondaryColor
                    .withValues(alpha: 0.8),
                fontSize: context.isMobile ? 14 : 15,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),

            // Read More Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => launchUrl(Uri.parse(article.source)),
                  child: Container(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
