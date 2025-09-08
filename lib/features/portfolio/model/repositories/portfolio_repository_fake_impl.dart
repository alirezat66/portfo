import '../../../../core/models/result.dart';
import '../data/portfolio_item.dart';
import 'portfolio_repository.dart';

class PortfolioRepositoryFakeImpl implements PortfolioRepository {
  static final List<PortfolioItem> _fakeData = [
    PortfolioItem(
      id: '1',
      title: 'E-Commerce Mobile App',
      description:
          'A full-featured e-commerce mobile application built with Flutter',
      imageUrl: 'https://via.placeholder.com/400x300',
      technologies: ['Flutter', 'Dart', 'Firebase', 'Bloc'],
      liveUrl: 'https://example.com',
      githubUrl: 'https://github.com/example/repo',
      createdAt: DateTime(2023, 12, 15),
    ),
    PortfolioItem(
      id: '2',
      title: 'Portfolio Website',
      description:
          'A responsive portfolio website showcasing my work and skills',
      imageUrl: 'https://via.placeholder.com/400x300',
      technologies: ['Flutter', 'Web', 'Responsive Design'],
      liveUrl: 'https://portfolio.example.com',
      githubUrl: 'https://github.com/example/portfolio',
      createdAt: DateTime(2024, 1, 20),
    ),
    PortfolioItem(
      id: '3',
      title: 'Task Management App',
      description:
          'A collaborative task management application with real-time updates',
      imageUrl: 'https://via.placeholder.com/400x300',
      technologies: ['Flutter', 'Firebase', 'WebSocket', 'Provider'],
      githubUrl: 'https://github.com/example/task-app',
      createdAt: DateTime(2023, 10, 5),
    ),
  ];

  @override
  Future<Result<List<PortfolioItem>>> getPortfolioItems() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    try {
      return Success(_fakeData);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<PortfolioItem>> getPortfolioItemById(String id) async {
    await Future.delayed(const Duration(milliseconds: 800));
    try {
      final item = _fakeData.firstWhere((item) => item.id == id);
      return Success(item);
    } catch (e) {
      return Failure('Portfolio item not found');
    }
  }
}




