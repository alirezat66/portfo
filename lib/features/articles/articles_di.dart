import '../../../core/di/service_locator.dart';
import 'model/repositories/articles_repository.dart';
import 'view_model/articles_cubit.dart';

void configureArticlesDependencies() {
  getIt.registerLazySingleton<ArticlesRepository>(
      () => ArticlesRepositoryImpl());
  getIt.registerFactory<ArticlesCubit>(() => ArticlesCubit(getIt()));
}
