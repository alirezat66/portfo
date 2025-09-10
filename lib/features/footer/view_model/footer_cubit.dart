import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/data/footer_data.dart';
import '../model/repositories/footer_repository.dart';

// States
abstract class FooterState extends Equatable {
  const FooterState();

  @override
  List<Object?> get props => [];
}

class FooterInitial extends FooterState {}

class FooterLoading extends FooterState {}

class FooterLoaded extends FooterState {
  final FooterData footerData;

  const FooterLoaded(this.footerData);

  @override
  List<Object?> get props => [footerData];
}

class FooterError extends FooterState {
  final String message;

  const FooterError(this.message);

  @override
  List<Object?> get props => [message];
}

// Cubit
class FooterCubit extends Cubit<FooterState> {
  final FooterRepository _repository;

  FooterCubit({required FooterRepository repository})
      : _repository = repository,
        super(FooterInitial());

  Future<void> loadFooterData() async {
    emit(FooterLoading());
    try {
      final footerData = await _repository.getFooterData();
      emit(FooterLoaded(footerData));
    } catch (e) {
      emit(FooterError(e.toString()));
    }
  }

  Future<void> refreshFooterData() async {
    await loadFooterData();
  }
}
