part of 'testimonials_cubit.dart';

sealed class TestimonialsState extends Equatable {
  const TestimonialsState();

  @override
  List<Object> get props => [];
}

final class TestimonialsInitial extends TestimonialsState {}

final class TestimonialsLoading extends TestimonialsState {}

final class TestimonialsLoaded extends TestimonialsState {
  final List<Testimonial> testimonials;

  const TestimonialsLoaded(this.testimonials);

  @override
  List<Object> get props => [testimonials];
}

final class TestimonialsError extends TestimonialsState {
  final String message;

  const TestimonialsError(this.message);

  @override
  List<Object> get props => [message];
}
