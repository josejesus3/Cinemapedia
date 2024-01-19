import 'package:cinemapedia/domain/entities/movies.dart';

abstract class MoviesDatasources {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
