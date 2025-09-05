import '../../../../core/models/result.dart';
import '../data/portfolio_item.dart';

abstract class PortfolioRepository {
  Future<Result<List<PortfolioItem>>> getPortfolioItems();
  Future<Result<PortfolioItem>> getPortfolioItemById(String id);
}



