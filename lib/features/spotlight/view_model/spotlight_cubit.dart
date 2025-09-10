import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/data/profile.dart';
import '../models/repositories/spotlight_repository.dart';

// States
abstract class SpotlightState extends Equatable {
  const SpotlightState();

  @override
  List<Object?> get props => [];
}

class SpotlightInitial extends SpotlightState {}

class SpotlightLoading extends SpotlightState {}

class SpotlightLoaded extends SpotlightState {
  final Profile profile;

  const SpotlightLoaded({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class SpotlightError extends SpotlightState {
  final String message;

  const SpotlightError({required this.message});

  @override
  List<Object?> get props => [message];
}

// Cubit
class SpotlightCubit extends Cubit<SpotlightState> {
  final SpotlightRepository _repository;

  SpotlightCubit({required SpotlightRepository repository})
      : _repository = repository,
        super(SpotlightInitial());

  Future<void> loadProfile() async {
    try {
      emit(SpotlightLoading());
      final profile = await _repository.getProfile();
      emit(SpotlightLoaded(profile: profile));
    } catch (e) {
      emit(SpotlightError(message: e.toString()));
    }
  }

  void refreshProfile() {
    loadProfile();
  }
}
