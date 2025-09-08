class Article {
  final String title;
  final String description;
  final String readTime;
  final String category;
  final String imageUrl;
  final String url;

  const Article({
    required this.title,
    required this.description,
    required this.readTime,
    required this.category,
    required this.imageUrl,
    required this.url,
  });

  static const List<Article> sampleArticles = [
    Article(
      title: 'Next.js API Routes',
      description:
          'Create API endpoints within your Next.js app for data retrieval and management.',
      readTime: '5-min read',
      category: 'Next.js',
      imageUrl: 'assets/images/article_nextjs.png',
      url: 'https://example.com/nextjs-api-routes',
    ),
    Article(
      title: 'React State Management',
      description:
          'Explore efficient state management techniques within React applications.',
      readTime: '12-min read',
      category: 'React',
      imageUrl: 'assets/images/article_react.png',
      url: 'https://example.com/react-state-management',
    ),
    Article(
      title: 'Introduction to Tailwind',
      description:
          'Discover the basics of Tailwind CSS and its utility-first approach.',
      readTime: '10-min read',
      category: 'TailwindCss',
      imageUrl: 'assets/images/article_tailwind.png',
      url: 'https://example.com/intro-to-tailwind',
    ),
    Article(
      title: 'Flutter Responsive Design',
      description: 'Master responsive design patterns in Flutter applications.',
      readTime: '8-min read',
      category: 'Flutter',
      imageUrl: 'assets/images/article_flutter.png',
      url: 'https://example.com/flutter-responsive',
    ),
    Article(
      title: 'TypeScript Best Practices',
      description:
          'Learn advanced TypeScript patterns for better code quality.',
      readTime: '15-min read',
      category: 'TypeScript',
      imageUrl: 'assets/images/article_typescript.png',
      url: 'https://example.com/typescript-best-practices',
    ),
  ];
}
