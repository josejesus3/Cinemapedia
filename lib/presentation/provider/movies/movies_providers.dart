import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/presentation/provider/movies/movies_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = 
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
  final fetchMoreMovie = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MovieNotifier(fetchMoreMovie: fetchMoreMovie);
});
//*Peliculas populares
final popularMoviesProvider =
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
  final fetchMoreMovie = ref.watch(movieRepositoryProvider).getpopular;
  return MovieNotifier(fetchMoreMovie: fetchMoreMovie);
});

//*top_rated populares
final topRatedMoviesProvider =
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
  final fetchMoreMovie = ref.watch(movieRepositoryProvider).getTopRated;
  return MovieNotifier(fetchMoreMovie: fetchMoreMovie);
});

//*Upcoming populares
final upcomingMoviesProvider =
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
  final fetchMoreMovie = ref.watch(movieRepositoryProvider).getUpcoming;
  return MovieNotifier(fetchMoreMovie: fetchMoreMovie);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MovieNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isloading = false;
  MovieCallback fetchMoreMovie;
  MovieNotifier({required this.fetchMoreMovie}) : super([]);

  Future<void> loadNextPage() async {
    if (isloading) return;
    isloading = true;

    currentPage++;

    final List<Movie> movies = await fetchMoreMovie(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isloading = false;
  }
}
