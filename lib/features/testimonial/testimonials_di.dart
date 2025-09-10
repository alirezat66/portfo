import '../../../core/di/service_locator.dart';
import 'model/repositories/testimonials_repository.dart';
import 'view_model/testimonials_cubit.dart';

void configureTestimonialsDependencies() {
  getIt.registerLazySingleton<TestimonialsRepository>(
      () => TestimonialsRepositoryImpl());
  getIt.registerFactory<TestimonialsCubit>(() => TestimonialsCubit(getIt()));
}
