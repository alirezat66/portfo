import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/navigation/view_model/bloc/navigation_cubit.dart';

class MyDrawerButton extends StatelessWidget {
  final bool isMobileMenuOpen;
  const MyDrawerButton({super.key, required this.isMobileMenuOpen});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isMobileMenuOpen ? Icons.close : Icons.menu,
        color: Colors.white,
      ),
      onPressed: () {
        context.read<NavigationCubit>().toggleMobileMenu();
      },
    );
  }
}
