import '../../core/di/service_locator.dart';
import 'model/repositories/works_repository.dart';
import 'view_model/works_cubit.dart';

void configureWorksDependencies() {
  getIt.registerLazySingleton<WorksRepository>(() => WorksRepositoryImpl());
  getIt.registerFactory(() => WorksCubit(getIt<WorksRepository>()));
}
