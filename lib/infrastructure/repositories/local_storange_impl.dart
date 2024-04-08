import 'package:cinemapedia/domain/datasources/local_storenge_datasources.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/domain/repositories/local_storange_repository.dart';

class LocalStorangeImpl extends LocalStorangeRepository {
  final LocalStorangeDatasource datasource;

  LocalStorangeImpl({required this.datasource});
  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovie({int limit = 12, offset = 0}) {
    return datasource.loadMovie(limit: limit, offset: offset);
  }

  @override
  Future<void> toogleFavorite(Movie movie) {
    return datasource.toogleFavorite(movie);
  }
}
