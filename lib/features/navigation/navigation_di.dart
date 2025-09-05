import '../../core/di/service_locator.dart';
import 'view_model/bloc/navigation_cubit.dart';

void setupNavigationDI() {
  getIt.registerFactory(() => NavigationCubit());
}



