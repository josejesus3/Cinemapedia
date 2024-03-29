import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helper/human_format.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:flutter/material.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallback searchMovie;
  List<Movie> initialMovies;
  StreamController debounceMovies = StreamController.broadcast();
  StreamController isLoadingStream = StreamController.broadcast();

  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.searchMovie,
    required this.initialMovies, 
  });
  void closeStream() {
    debounceMovies.close();
  }

  void _onQueryChange(String query) {
    isLoadingStream.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        debounceMovies.add([]);
        return;
      }
      final movies = await searchMovie(query);
      initialMovies = movies;
      debounceMovies.add(movies);
      isLoadingStream.add(false);
    });
  }

  @override
  String get searchFieldLabel => 'Buscar Pelicula';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data??false) {
            return SpinPerfect(
              animate: true,
              duration: const Duration(seconds:5 ),
              child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  query = '';
                },
              ),
            );
          }
          return FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
                icon: const Icon(Icons.clear_rounded),
                onPressed: () => query = ''),
          );
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return FadeInDown(
      child: IconButton(
          onPressed: () {
            closeStream();
            close(context, null);
          },
          icon: const Icon(Icons.arrow_back_outlined)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResponse(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChange(query);
    return buildResponse(context);
  }

  Widget buildResponse(BuildContext context) {
    return StreamBuilder(
      initialData: initialMovies,
      stream: debounceMovies.stream,
      builder: (context, snapshot) {
        final movie = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movie.length,
          itemBuilder: (BuildContext context, int index) {
            final Movie movies = movie[index];
            return _MovieItem(
              movies: movies,
              onMovieSelected: (context, movies) {
                closeStream();
                close(context, movies);
              },
            );
          },
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movies;
  final Function onMovieSelected;
  const _MovieItem({
    required this.movies,
    required this.onMovieSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final sized = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movies);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: sized.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movies.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: sized.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movies.title,
                    style: textStyle.titleMedium,
                  ),
                  movies.overview.length > 100
                      ? Text(movies.overview.substring(0, 100))
                      : Text(movies.overview),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_outlined,
                        color: Colors.yellow.shade800,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        HumanFormat.number(movies.voteAverage, 1),
                        style: textStyle.bodyMedium!
                            .copyWith(color: Colors.yellow.shade800),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
