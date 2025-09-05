import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../view_model/bloc/navigation_cubit.dart';
import '../../view_model/bloc/navigation_state.dart';

class NavigationMenuItems extends StatelessWidget {
  const NavigationMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Row(
          children: [
            _buildMenuItem(
              context,
              'Works',
              '/works',
              state.currentRoute == '/works',
            ),
            const SizedBox(width: 32),
            _buildMenuItem(
              context,
              'Blog',
              '/blog',
              state.currentRoute == '/blog',
            ),
            const SizedBox(width: 32),
            _buildMenuItem(
              context,
              'About',
              '/about',
              state.currentRoute == '/about',
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuItem(
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          border: isActive
              ? const Border(bottom: BorderSide(color: Colors.white, width: 2))
              : null,
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
