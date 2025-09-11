import '../../core/di/service_locator.dart';
import 'model/repositories/github_calendar_repository.dart';
import 'view_model/github_calendar_cubit.dart';

void configureGitHubCalendarDependencies() {
  getIt.registerLazySingleton<GitHubCalendarRepository>(
    () => GitHubCalendarRepositoryImpl(),
  );
  getIt.registerFactory(
    () => GitHubCalendarCubit(getIt<GitHubCalendarRepository>()),
  );
}
