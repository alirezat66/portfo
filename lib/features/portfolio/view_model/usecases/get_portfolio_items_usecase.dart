import '../../../../core/models/result.dart';
import '../../model/data/portfolio_item.dart';
import '../../model/repositories/portfolio_repository.dart';

class GetPortfolioItemsUseCase {
  final PortfolioRepository _repository;

  GetPortfolioItemsUseCase(this._repository);

  Future<Result<List<PortfolioItem>>> call() async {
    return await _repository.getPortfolioItems();
  }
}



