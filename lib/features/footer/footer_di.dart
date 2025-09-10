import '../../../core/di/service_locator.dart';
import 'model/repositories/footer_repository.dart';
import 'view_model/footer_cubit.dart';

void configureFooterDependencies() {
  // Register Repository
  getIt.registerLazySingleton<FooterRepository>(
    () => FooterRepositoryImpl(),
  );

  // Register Cubit (Factory to create new instance each time)
  getIt.registerFactory<FooterCubit>(
    () => FooterCubit(repository: getIt<FooterRepository>()),
  );
}
