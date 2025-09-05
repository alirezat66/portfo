import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final bool isMobileMenuOpen;
  final String currentRoute;

  const NavigationState({
    this.isMobileMenuOpen = false,
    this.currentRoute = '/',
  });

  NavigationState copyWith({bool? isMobileMenuOpen, String? currentRoute}) {
    return NavigationState(
      isMobileMenuOpen: isMobileMenuOpen ?? this.isMobileMenuOpen,
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }

  @override
  List<Object> get props => [isMobileMenuOpen, currentRoute];
}



