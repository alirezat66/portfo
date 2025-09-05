import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isDesktop ? 300 : 200,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Site ...',
          prefixIcon: Icon(Icons.search, color: context.colorScheme.onTertiary),
          hintStyle: TextStyle(color: Color(0xFFF5F5F5), fontSize: 14),
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
