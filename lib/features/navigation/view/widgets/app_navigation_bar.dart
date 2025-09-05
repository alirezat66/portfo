import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import '../../view_model/bloc/navigation_cubit.dart';
import '../../view_model/bloc/navigation_state.dart';
import 'navigation_menu_items.dart';
import 'search_bar_widget.dart';
import 'social_media_icons.dart';
import 'lets_talk_button.dart';

class AppNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: AnimatedPadding(
            padding: isDesktop
                ? const EdgeInsets.symmetric(horizontal: 48.0)
                : isTablet
                ? const EdgeInsets.symmetric(horizontal: 24)
                : const EdgeInsets.symmetric(horizontal: 16),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.go('/');
                        context.read<NavigationCubit>().updateCurrentRoute('/');
                      },
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: context.colorScheme.onSurface,
                        child: Icon(
                          Icons.home,
                          color: context.colorScheme.surface,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                    const NavigationMenuItems(),
                    if (isDesktop) ...[
                      const Spacer(),
                      const SearchBarWidget(),
                      const Spacer(),
                      const SocialMediaIcons(),
                      const SizedBox(width: 16),
                      const LetsTalkButton(),
                    ] else if (isTablet) ...[
                      const Spacer(),
                      const LetsTalkButton(),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: Icon(
                          state.isMobileMenuOpen ? Icons.close : Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context.read<NavigationCubit>().toggleMobileMenu();
                        },
                      ),
                    ] else ...[
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          state.isMobileMenuOpen ? Icons.close : Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context.read<NavigationCubit>().toggleMobileMenu();
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(96);
}
