import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/presentation/provider/movies/movies_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final fetchMoreMovie = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie: fetchMoreMovie);
});
typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;
  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String muvieId) async {
    if (state[muvieId] != null) return;

    final movie = await getMovie(muvieId);
    state = {...state, muvieId: movie};
  }
}
