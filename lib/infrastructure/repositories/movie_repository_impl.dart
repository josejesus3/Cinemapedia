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
  
}
