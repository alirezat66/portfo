import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../view_model/bloc/navigation_cubit.dart';
import '../../view_model/bloc/navigation_state.dart';
import 'social_media_icons.dart';
import 'lets_talk_button.dart';

class MobileMenuDrawer extends StatelessWidget {
  const MobileMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        if (!state.isMobileMenuOpen) {
          return const SizedBox.shrink();
        }

        return Positioned(
          top: kToolbarHeight,
          left: 0,
          right: 0,
          child: Container(
            color: const Color(0xFF151515),
            child: Column(
              children: [
                _buildMobileMenuItem(
                  context,
                  'Works',
                  '/works',
                  state.currentRoute == '/works',
                ),
                _buildMobileMenuItem(
                  context,
                  'Blog',
                  '/blog',
                  state.currentRoute == '/blog',
                ),
                _buildMobileMenuItem(
                  context,
                  'About',
                  '/about',
                  state.currentRoute == '/about',
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 16,
                    children: [
                      const SocialMediaIcons(),
                      const LetsTalkButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileMenuItem(
    BuildContext context,
    String title,
    String route,
    bool isActive,
  ) {
    return GestureDetector(
      onTap: () {
        context.go(route);
        context.read<NavigationCubit>().updateCurrentRoute(route);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2A2A2A) : null,
          border: const Border(
            bottom: BorderSide(color: Color(0xFF404040), width: 0.5),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
