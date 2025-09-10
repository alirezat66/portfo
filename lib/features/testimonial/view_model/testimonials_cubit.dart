import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/data/testimonial.dart';
import '../model/repositories/testimonials_repository.dart';

part 'testimonials_state.dart';

class TestimonialsCubit extends Cubit<TestimonialsState> {
  final TestimonialsRepository _repository;

  TestimonialsCubit(this._repository) : super(TestimonialsInitial());

  Future<void> loadTestimonials() async {
    emit(TestimonialsLoading());
    try {
      final testimonials = await _repository.getTestimonials();
      emit(TestimonialsLoaded(testimonials));
    } catch (e) {
      emit(TestimonialsError(e.toString()));
    }
  }

  Future<void> refreshTestimonials() async {
    await loadTestimonials();
  }
}
