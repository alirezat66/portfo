import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/data/article.dart';
import '../model/repositories/articles_repository.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticlesRepository _repository;

  ArticlesCubit(this._repository) : super(ArticlesInitial());

  Future<void> loadArticles() async {
    emit(ArticlesLoading());
    try {
      final articles = await _repository.getArticles();
      emit(ArticlesLoaded(articles));
    } catch (e) {
      emit(ArticlesError(e.toString()));
    }
  }

  Future<void> loadLatestArticles({int limit = 3}) async {
    emit(ArticlesLoading());
    try {
      final articles = await _repository.getLatestArticles(limit: limit);
      emit(ArticlesLoaded(articles));
    } catch (e) {
      emit(ArticlesError(e.toString()));
    }
  }

  Future<void> loadArticlesByCategory(String category) async {
    emit(ArticlesLoading());
    try {
      final articles = await _repository.getArticlesByCategory(category);
      emit(ArticlesLoaded(articles));
    } catch (e) {
      emit(ArticlesError(e.toString()));
    }
  }

  Future<void> searchArticles(String query) async {
    emit(ArticlesLoading());
    try {
      final articles = await _repository.searchArticles(query);
      emit(ArticlesLoaded(articles));
    } catch (e) {
      emit(ArticlesError(e.toString()));
    }
  }

  Future<void> refreshArticles() async {
    await loadArticles();
  }
}
