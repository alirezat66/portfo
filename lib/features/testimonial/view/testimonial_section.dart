import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/view/widgets/glow_card.dart';
import 'package:portfolio/core/view/widgets/section_widget.dart';
import 'package:portfolio/features/testimonial/model/data/testimonial.dart';
import 'package:portfolio/features/testimonial/view/testimonial_widget.dart';
import 'package:portfolio/features/testimonial/view_model/testimonials_cubit.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class TestimonialView extends StatelessWidget {
  const TestimonialView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TestimonialsCubit>()..loadTestimonials(),
      child: const TestimonialContent(),
    );
  }
}

class TestimonialContent extends StatelessWidget {
  const TestimonialContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestimonialsCubit, TestimonialsState>(
      builder: (context, state) {
        if (state is TestimonialsLoading) {
          return SectionWidget(
            title: 'Testimonials',
            child: const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if (state is TestimonialsError) {
          return SectionWidget(
            title: 'Testimonials',
            child: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${state.message}'),
                    ElevatedButton(
                      onPressed: () => context
                          .read<TestimonialsCubit>()
                          .refreshTestimonials(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is TestimonialsLoaded) {
          // Get different number of testimonials based on screen size
          final displayedTestimonials =
              _getDisplayedTestimonials(context, state.testimonials);

          return SectionWidget(
            title: 'Testimonials',
            child: _buildTestimonialLayout(context, displayedTestimonials),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  List<Testimonial> _getDisplayedTestimonials(
      BuildContext context, List<Testimonial> testimonials) {
    if (context.isDesktop) {
      return testimonials.take(3).toList(); // 3 items for desktop
    } else if (context.isLaptop) {
      return testimonials.take(2).toList(); // 2 items for laptop
    } else {
      return testimonials
          .take(3)
          .toList(); // 3 items for tablet/mobile (in column)
    }
  }

  Widget _buildTestimonialLayout(
      BuildContext context, List<Testimonial> testimonials) {
    if (context.isTablet || context.isMobile) {
      // Column layout for tablet and mobile
      return Column(
        spacing: 24,
        children: testimonials
            .map((testimonial) =>
                GlowCard(child: TestimonialWidget(testimonial: testimonial)))
            .toList(),
      );
    } else {
      // Row layout for desktop and laptop
      return IntrinsicHeight(
        child: Row(
          spacing: 24,
          children: testimonials
              .map((testimonial) => Expanded(
                  child: GlowCard(
                      child: TestimonialWidget(testimonial: testimonial))))
              .toList(),
        ),
      );
    }
  }
}
