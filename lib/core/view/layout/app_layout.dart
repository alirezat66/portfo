import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/navigation/view/widgets/app_navigation_bar.dart';
import 'package:portfolio/features/navigation/view/widgets/mobile_menu_drawer.dart';
import 'package:portfolio/features/navigation/view_model/bloc/navigation_cubit.dart';

class AppLayout extends StatelessWidget {
  final Widget body;

  const AppLayout({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NavigationCubit>(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: const AppNavigationBar(),
        body: Stack(
          children: [
            body,
            const MobileMenuDrawer(),
          ],
        ),
      ),
    );
  }
}
