import 'package:go_router/go_router.dart';
import '../../../features/about/view/about_page.dart';
import '../../../features/blog/view/blog_page.dart';
import '../../../features/home/view/home_page.dart';
import '../../../features/works/view/works_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/works',
      name: 'works',
      builder: (context, state) => const WorksPage(),
    ),
    GoRoute(
      path: '/blog',
      name: 'blog',
      builder: (context, state) => const BlogPage(),
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutPage(),
    ),
  ],
);
