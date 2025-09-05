import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/home/spotlight/spotlight_view.dart';
import 'package:portfolio/features/home/spotlight/widgets/profile_highlights.dart';
import 'package:portfolio/features/home/spotlight/widgets/profile_image.dart';
import 'package:portfolio/widgets/responsive_content.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/models/availability_status.dart';
import '../../../widgets/availability_widget.dart';
import '../../navigation/view_model/bloc/navigation_cubit.dart';
import '../../navigation/view/widgets/app_navigation_bar.dart';
import '../../navigation/view/widgets/mobile_menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NavigationCubit>(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ResponsiveContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpotlightView(),
                  const Text(
                    'Availability Widget Showcase',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildAvailabilityShowcase(context),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          const MobileMenuDrawer(),
        ],
      ),
    );
  }

  Widget _buildAvailabilityShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection(
          'Available for Work',
          [
            const AvailabilityWidget(status: AvailabilityStatus.available),
          ],
          context,
        ),
        const SizedBox(height: 32),
        _buildSection(
          'Partially Available',
          [
            const AvailabilityWidget(
                status: AvailabilityStatus.partiallyAvailable),
          ],
          context,
        ),
        const SizedBox(height: 32),
        _buildSection(
          'Fully Busy',
          [
            const AvailabilityWidget(
              status: AvailabilityStatus.fullyBusy,
            ),
          ],
          context,
        ),
      ],
    );
  }

  Widget _buildSection(
      String title, List<Widget> widgets, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: context.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: widgets,
        ),
      ],
    );
  }
}
