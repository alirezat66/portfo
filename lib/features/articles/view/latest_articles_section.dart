import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/view/widgets/section_widget.dart';
import 'package:portfolio/features/articles/view_model/articles_cubit.dart';
import 'package:portfolio/features/articles/view/widgets/article_card.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class LatestArticlesSection extends StatelessWidget {
  const LatestArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ArticlesCubit>()..loadLatestArticles(limit: 3),
      child: const LatestArticlesContent(),
    );
  }
}

class LatestArticlesContent extends StatelessWidget {
  const LatestArticlesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return SectionWidget(
            title: 'Latest Articles',
            child: const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if (state is ArticlesError) {
          return SectionWidget(
            title: 'Latest Articles',
            child: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${state.message}'),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<ArticlesCubit>().refreshArticles(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is ArticlesLoaded) {
          return SectionWidget(
            title: 'Latest Articles',
            child: _buildArticlesGrid(context, state.articles),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildArticlesGrid(BuildContext context, List articles) {
    if (articles.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: Text('No articles available'),
        ),
      );
    }
    if (context.isTablet || context.isMobile) {
      return Column(
        spacing: 24,
        children:
            articles.map((article) => ArticleCard(article: article)).toList(),
      );
    }
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
