import '../../../core/di/service_locator.dart';
import 'models/repositories/companies_repository.dart';
import 'view_model/companies_cubit.dart';

void configureCompaniesDependencies() {
  // Register Repository
  getIt.registerLazySingleton<CompaniesRepository>(
    () => CompaniesRepositoryImpl(),
  );

  // Register Cubit (Factory to create new instance each time)
  getIt.registerFactory<CompaniesCubit>(
    () => CompaniesCubit(repository: getIt<CompaniesRepository>()),
  );
}
