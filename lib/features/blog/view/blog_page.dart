import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/articles/model/data/article.dart';
import 'package:portfolio/features/articles/view_model/articles_cubit.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ArticlesCubit>()..loadArticles(),
      child: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, state) {
          return ResponsiveContent(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    'Blog & Articles',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Thoughts, tutorials, and insights on software development',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[400],
                        ),
                  ),
                  const SizedBox(height: 48),

                  // Articles List
                  () {
                    switch (state) {
                      case ArticlesLoading():
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ArticlesError(message: final message):
                        return Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 64,
                                color: Colors.red[300],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Failed to load articles',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: Colors.red[300],
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                message,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey[400],
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      case ArticlesLoaded(articles: final articles):
                        return _buildArticlesList(context, articles);
                      case ArticlesInitial():
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                    }
                  }(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildArticlesList(BuildContext context, List<Article> articles) {
    if (articles.isEmpty) {
      return Center(
        child: Column(
          children: [
            Icon(
              Icons.article_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No articles available',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.grey[400],
                  ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: articles
          .map((article) => _buildArticleCard(context, article))
          .toList(),
    );
  }

  Widget _buildArticleCard(BuildContext context, Article article) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF333333),
          width: 1,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: context.isDesktop ? 200 : 120,
              height: context.isDesktop ? 150 : 90,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(article.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: context.basicColors.surfaceBrandColor
                            .withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        article.category,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: context.basicColors.surfaceBrandColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Title
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Excerpt
                    Text(
                      article.excerpt,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[400],
                          ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),

                    // Meta info
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          article.readTime,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[500],
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Read More Button
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
