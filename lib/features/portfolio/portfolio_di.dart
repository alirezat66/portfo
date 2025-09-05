import '../../core/di/service_locator.dart';
import 'model/repositories/portfolio_repository.dart';
import 'model/repositories/portfolio_repository_fake_impl.dart';
import 'view_model/usecases/get_portfolio_items_usecase.dart';

void setupPortfolioDI() {
  getIt.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryFakeImpl(),
  );

  getIt.registerLazySingleton(() => GetPortfolioItemsUseCase(getIt()));
}


