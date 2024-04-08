import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/domain/repositories/local_storange_repository.dart';
import 'package:cinemapedia/presentation/provider/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMovieProvider =
    StateNotifierProvider<StorangeMovieNotifier, Map<int, Movie>>((ref) {
  final localStorangeRepository = ref.watch(localStorangeProvider);
  return StorangeMovieNotifier(
      localStorangeRepository: localStorangeRepository);
});

class StorangeMovieNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  LocalStorangeRepository localStorangeRepository;
  StorangeMovieNotifier({
    required this.localStorangeRepository,
  }) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movie = await localStorangeRepository.loadMovie(
      offset: page * 10,
    );
    page++;
    final Map<int, Movie> tempMoviesMap = {};
    for (var movies in movie) {
      tempMoviesMap[movies.id] = movies;
    }
    state = {...state, ...tempMoviesMap};
    return movie;
  }

  Future<void> toogleFavorite(Movie movie) async {
    await localStorangeRepository.toogleFavorite(movie);
    final bool isMovieFavorite = state[movie.id] != null;
    if (isMovieFavorite) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
