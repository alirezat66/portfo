import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/repositories/works_repository.dart';
import 'works_state.dart';

class WorksCubit extends Cubit<WorksState> {
  final WorksRepository _worksRepository;

  WorksCubit(this._worksRepository) : super(const WorksState());

  void loadWorks() async {
    emit(state.copyWith(isLoading: true, hasError: false));

    try {
      // Load all works data from JSON file
      final works = await _worksRepository.getWorks();

      emit(state.copyWith(
        works: works,
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

  void loadSelectedWorks() async {
    emit(state.copyWith(isLoading: true, hasError: false));

    try {
      // Load selected works (first 4) from JSON file
      final works = await _worksRepository.getSelectedWorks();

      emit(state.copyWith(
        works: works,
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
}
