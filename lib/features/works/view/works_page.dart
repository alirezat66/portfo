import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/navigation/view/widgets/app_navigation_bar.dart';
import 'package:portfolio/features/works/model/data/work_item.dart';
import 'package:portfolio/features/works/view_model/works_cubit.dart';
import 'package:portfolio/features/works/view_model/works_state.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<WorksCubit>()..loadWorks(),
        child: Scaffold(
          appBar: const AppNavigationBar(),
          body: BlocBuilder<WorksCubit, WorksState>(
            builder: (context, state) {
              return ResponsiveContent(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Text(
                        'My Works',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'A showcase of my recent projects and contributions',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[400],
                            ),
                      ),
                      const SizedBox(height: 48),

                      // Works Grid
                      if (state.isLoading)
                        const Center(
                          child: CircularProgressIndicator(),
                        )
                      else if (state.hasError)
                        Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 64,
                                color: Colors.red[300],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Failed to load works',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: Colors.red[300],
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.errorMessage ?? 'Unknown error occurred',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey[400],
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      else
                        _buildWorksGrid(context, state.works),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  Widget _buildWorksGrid(BuildContext context, List<WorkItem> works) {
    if (works.isEmpty) {
      return Center(
        child: Column(
          children: [
            Icon(
              Icons.work_outline,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No works available',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.grey[400],
                  ),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        double childAspectRatio;

        if (context.isDesktop) {
          crossAxisCount = 3;
          childAspectRatio = 1.2;
        } else if (context.isLaptop) {
          crossAxisCount = 2;
          childAspectRatio = 1.1;
        } else {
          crossAxisCount = 1;
          childAspectRatio = 1.3;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          ),
          itemCount: works.length,
          itemBuilder: (context, index) {
            return _buildWorkCard(context, works[index]);
          },
        );
      },
    );
  }

  Widget _buildWorkCard(BuildContext context, WorkItem work) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF333333),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(work.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    work.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    work.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[400],
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),

                  // Technologies
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: work.technologies.take(3).map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: context.basicColors.surfaceBrandColor
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          tech,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: context.basicColors.surfaceBrandColor,
                                fontSize: 10,
                              ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
