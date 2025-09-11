import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/repositories/github_calendar_repository.dart';
import 'github_calendar_state.dart';

class GitHubCalendarCubit extends Cubit<GitHubCalendarState> {
  final GitHubCalendarRepository _repository;

  GitHubCalendarCubit(this._repository) : super(const GitHubCalendarState());

  void loadGitHubHistory(String username) async {
    emit(state.copyWith(isLoading: true, hasError: false));

    try {
      final years = await _repository.getGitHubHistory(username);

      // Set the most recent year as default selected year
      final selectedYear =
          years.isNotEmpty ? years.first.year : DateTime.now().year;

      emit(state.copyWith(
        years: years,
        selectedYear: selectedYear,
        isLoading: false,
        hasError: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  void selectYear(int year) {
    emit(state.copyWith(selectedYear: year));
  }
}
