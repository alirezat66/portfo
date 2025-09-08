import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void toggleMobileMenu() {
    emit(state.copyWith(isMobileMenuOpen: !state.isMobileMenuOpen));
  }

  void closeMobileMenu() {
    emit(state.copyWith(isMobileMenuOpen: false));
  }

  void updateCurrentRoute(String route) {
    emit(state.copyWith(currentRoute: route, isMobileMenuOpen: false));
  }
}




