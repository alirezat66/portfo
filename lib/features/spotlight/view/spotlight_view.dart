import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/features/spotlight/view_model/spotlight_cubit.dart';
import 'package:portfolio/features/spotlight/view/widgets/profile_highlights.dart';
import 'package:portfolio/features/spotlight/view/widgets/profile_image.dart';

class SpotlightView extends StatelessWidget {
  const SpotlightView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SpotlightCubit>()..loadProfile(),
      child: const SpotlightContent(),
    );
  }
}

class SpotlightContent extends StatelessWidget {
  const SpotlightContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotlightCubit, SpotlightState>(
      builder: (context, state) {
        if (state is SpotlightLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SpotlightError) {
          return Center(
            child: Column(
              children: [
                Text('Error: ${state.message}'),
                ElevatedButton(
                  onPressed: () =>
                      context.read<SpotlightCubit>().refreshProfile(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is SpotlightLoaded) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ProfileHighlights(profile: state.profile)),
              const SizedBox(width: 40),
              ProfileImage(profile: state.profile),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
