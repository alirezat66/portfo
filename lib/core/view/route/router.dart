import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/home/view/home_page.dart';

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
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('Works Page'))),
    ),
    GoRoute(
      path: '/blog',
      name: 'blog',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('Blog Page'))),
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('About Page'))),
    ),
  ],
);
