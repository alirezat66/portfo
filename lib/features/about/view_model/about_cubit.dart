import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/data/about_data.dart';
import '../model/repositories/about_repository.dart';

// States
abstract class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object?> get props => [];
}

class AboutInitial extends AboutState {}

class AboutLoading extends AboutState {}

class AboutLoaded extends AboutState {
  final AboutData aboutData;

  const AboutLoaded(this.aboutData);

  @override
  List<Object?> get props => [aboutData];
}

class AboutError extends AboutState {
  final String message;

  const AboutError(this.message);

  @override
  List<Object?> get props => [message];
}

// Cubit
class AboutCubit extends Cubit<AboutState> {
  final AboutRepository _repository;

  AboutCubit({required AboutRepository repository})
      : _repository = repository,
        super(AboutInitial());

  Future<void> loadAboutData() async {
    emit(AboutLoading());
    try {
      final aboutData = await _repository.getAboutData();
      emit(AboutLoaded(aboutData));
    } catch (e) {
      emit(AboutError(e.toString()));
    }
  }

  Future<void> refreshAboutData() async {
    await loadAboutData();
  }
}
