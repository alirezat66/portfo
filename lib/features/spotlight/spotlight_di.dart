import '../../../core/di/service_locator.dart';
import 'model/repositories/spotlight_repository.dart';
import 'model/repositories/spotlight_remote_repository.dart';
import 'view_model/spotlight_cubit.dart';

void configureSpotlightDependencies() {
  // Register Repository - Use remote repository to fetch from CMS
  getIt.registerLazySingleton<SpotlightRepository>(
    () => SpotlightRemoteRepositoryImpl(),
  );

  // Register Cubit (Factory to create new instance each time)
  getIt.registerFactory<SpotlightCubit>(
    () => SpotlightCubit(repository: getIt<SpotlightRepository>()),
  );
}
