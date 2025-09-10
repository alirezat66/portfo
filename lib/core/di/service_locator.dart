import 'package:get_it/get_it.dart';
import '../../features/navigation/navigation_di.dart';
import '../../features/portfolio/portfolio_di.dart';
import '../../features/spotlight/spotlight_di.dart';
import '../../features/companies/companies_di.dart';
import '../../features/testimonial/testimonials_di.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  setupNavigationDI();
  setupPortfolioDI();
  configureSpotlightDependencies();
  configureCompaniesDependencies();
  configureTestimonialsDependencies();
}
