import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/domain/repositories/movies_repositories.dart';

class MovieRepositoriImpl extends MoviesRepository {
  final MoviesDatasources datasources;

  MovieRepositoriImpl({required this.datasources});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasources.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasources.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getpopular({int page = 1}) {
    return datasources.getpopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasources.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return datasources.getMovieById(id);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) {
    return datasources.searchMovies(query);
  }
}
