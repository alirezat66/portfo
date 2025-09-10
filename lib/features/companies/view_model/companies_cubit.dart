import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/data/company.dart';
import '../model/repositories/companies_repository.dart';

// States
abstract class CompaniesState extends Equatable {
  const CompaniesState();

  @override
  List<Object?> get props => [];
}

class CompaniesInitial extends CompaniesState {}

class CompaniesLoading extends CompaniesState {}

class CompaniesLoaded extends CompaniesState {
  final List<Company> companies;

  const CompaniesLoaded({required this.companies});

  @override
  List<Object?> get props => [companies];
}

class CompaniesError extends CompaniesState {
  final String message;

  const CompaniesError({required this.message});

  @override
  List<Object?> get props => [message];
}

// Cubit
class CompaniesCubit extends Cubit<CompaniesState> {
  final CompaniesRepository _repository;

  CompaniesCubit({required CompaniesRepository repository})
      : _repository = repository,
        super(CompaniesInitial());

  Future<void> loadCompanies() async {
    try {
      emit(CompaniesLoading());
      final companies = await _repository.getCompanies();
      emit(CompaniesLoaded(companies: companies));
    } catch (e) {
      emit(CompaniesError(message: e.toString()));
    }
  }

  void refreshCompanies() {
    loadCompanies();
  }
}
