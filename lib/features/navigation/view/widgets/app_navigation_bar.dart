import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/navigation/view/widgets/drawer_button.dart';
import 'package:portfolio/widgets/responsive_content.dart';
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
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: AnimatedPadding(
            padding: context.isDesktop
                ? const EdgeInsets.symmetric(horizontal: 96.0)
                : context.isLaptop
                    ? const EdgeInsets.symmetric(horizontal: 48.0)
                    : context.isTablet
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
                        backgroundColor: context.colorScheme.inverseSurface,
                        child: Icon(
                          Icons.home,
                          color: context.colorScheme.surface,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                    if (context.isDesktop) ...[
                      const NavigationMenuItems(),
                      const Spacer(),
                      const SearchBarWidget(),
                      const Spacer(),
                      const SocialMediaIcons(),
                      const SizedBox(width: 16),
                      const LetsTalkButton(),
                    ] else if (context.isLaptop) ...[
                      const Spacer(),
                      const SearchBarWidget(),
                      const Spacer(),
                      MyDrawerButton(isMobileMenuOpen: state.isMobileMenuOpen)
                    ] else ...[
                      const Spacer(),
                      MyDrawerButton(isMobileMenuOpen: state.isMobileMenuOpen)
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
