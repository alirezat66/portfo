import 'package:equatable/equatable.dart';
import '../model/data/work_item.dart';

class WorksState extends Equatable {
  final List<WorkItem> works;
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;

  const WorksState({
    this.works = const [],
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
  });

  WorksState copyWith({
    List<WorkItem>? works,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) {
    return WorksState(
      works: works ?? this.works,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [works, isLoading, hasError, errorMessage];
}
