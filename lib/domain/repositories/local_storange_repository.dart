import 'package:cinemapedia/domain/entities/movies.dart';

abstract class LocalStorangeRepository {
  Future<void> toogleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> loadMovie({int limit = 12, offset = 0});
}
