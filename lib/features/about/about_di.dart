import '../../../core/di/service_locator.dart';
import 'model/repositories/about_repository.dart';
import 'view_model/about_cubit.dart';

void configureAboutDependencies() {
  // Register Repository
  getIt.registerLazySingleton<AboutRepository>(
    () => AboutRepositoryImpl(),
  );

  // Register Cubit (Factory to create new instance each time)
  getIt.registerFactory<AboutCubit>(
    () => AboutCubit(repository: getIt<AboutRepository>()),
  );
}
