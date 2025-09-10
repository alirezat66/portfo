import '../../../core/di/service_locator.dart';
import 'models/repositories/spotlight_repository.dart';
import 'view_model/spotlight_cubit.dart';

void configureSpotlightDependencies() {
  // Register Repository
  getIt.registerLazySingleton<SpotlightRepository>(
    () => SpotlightRepositoryImpl(),
  );

  // Register Cubit (Factory to create new instance each time)
  getIt.registerFactory<SpotlightCubit>(
    () => SpotlightCubit(repository: getIt<SpotlightRepository>()),
  );
}
