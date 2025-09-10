import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/view/widgets/section_widget.dart';
import 'package:portfolio/features/works/view_model/works_cubit.dart';
import 'package:portfolio/features/works/view_model/works_state.dart';
import 'package:portfolio/widgets/responsive_content.dart';
import 'project_card.dart';

class LatestProjectsSection extends StatelessWidget {
  const LatestProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorksCubit>()..loadSelectedWorks(),
      child: SectionWidget(
        title: 'Selected Works',
        child: BlocBuilder<WorksCubit, WorksState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.hasError) {
              return Center(
                child: Text(
                  'Failed to load works: ${state.errorMessage}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.red[300],
                      ),
                ),
              );
            }

            final works = state.works;
            if (works.isEmpty) {
              return Center(
                child: Text(
                  'No works available',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[400],
                      ),
                ),
              );
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.isDesktop || context.isLaptop ? 2 : 1,
                childAspectRatio: context.isDesktop || context.isLaptop
                    ? 580 / 479.5
                    : 438 / 362.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: works.length,
              itemBuilder: (context, index) {
                return ProjectCard(workItem: works[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
