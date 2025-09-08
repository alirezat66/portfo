import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/articles/widgets/article_card.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class LatestArticlesSection extends StatelessWidget {
  const LatestArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = Article.sampleArticles;

    // Get different number of articles based on screen size
    final displayedArticles = _getDisplayedArticles(context, articles);

    return Column(
      spacing: 32,
      children: [
        Text(
          'Latest Articles',
          style: TextStyle(
            color: context.basicColors.textSecondaryColor,
            fontSize: 44,
            fontFamily: 'Zodiak',
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildArticleLayout(context, displayedArticles),
        ElevatedButton(
          onPressed: () {
            // Navigate to all articles page
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: Color(0xFF404040), width: 1),
            ),
          ),
          child: const Text(
            'Read All Articles',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  List<Article> _getDisplayedArticles(
      BuildContext context, List<Article> articles) {
    if (context.isDesktop) {
      return articles.take(3).toList(); // 3 items for desktop
    } else if (context.isLaptop) {
      return articles.take(2).toList(); // 2 items for laptop
    } else {
      return articles.take(3).toList(); // 3 items for tablet/mobile (in column)
    }
  }

  Widget _buildArticleLayout(BuildContext context, List<Article> articles) {
    if (context.isTablet || context.isMobile) {
      // Column layout for tablet and mobile
      return Column(
        spacing: 24,
        children:
            articles.map((article) => ArticleCard(article: article)).toList(),
      );
    } else {
      // Row layout for desktop and laptop
      return IntrinsicHeight(
        child: Row(
          spacing: 24,
          children: articles
              .map((article) => Expanded(child: ArticleCard(article: article)))
              .toList(),
        ),
      );
    }
  }
}
