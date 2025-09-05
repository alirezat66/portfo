import 'package:get_it/get_it.dart';
import '../../features/navigation/navigation_di.dart';
import '../../features/portfolio/portfolio_di.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  setupNavigationDI();
  setupPortfolioDI();
}
