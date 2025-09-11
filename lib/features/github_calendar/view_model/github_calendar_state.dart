import 'package:equatable/equatable.dart';
import '../model/data/github_activity.dart';

class GitHubCalendarState extends Equatable {
  final List<GitHubYearData> years;
  final int selectedYear;
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;

  const GitHubCalendarState({
    this.years = const [],
    this.selectedYear = 2024,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
  });

  GitHubCalendarState copyWith({
    List<GitHubYearData>? years,
    int? selectedYear,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) {
    return GitHubCalendarState(
      years: years ?? this.years,
      selectedYear: selectedYear ?? this.selectedYear,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  List<GitHubActivity> get selectedYearActivities {
    final yearData = years.firstWhere(
      (year) => year.year == selectedYear,
      orElse: () => const GitHubYearData(year: 2024, activities: []),
    );
    return yearData.activities;
  }

  List<int> get availableYears {
    return years.map((year) => year.year).toList();
  }

  @override
  List<Object?> get props => [
        years,
        selectedYear,
        isLoading,
        hasError,
        errorMessage,
      ];
}
