import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:flutter/material.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallback searchMovie;

  SearchMovieDelegate({required this.searchMovie});
  @override
  String get searchFieldLabel => 'Buscar Pelicula';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeInRight(
          animate: query.isNotEmpty,
          child: IconButton(
            icon: const Icon(Icons.clear_rounded),
            onPressed: () => query = '',
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return FadeInDown(
      child: IconButton(
          onPressed: () => close(context, null),
          icon: const Icon(Icons.arrow_back_outlined)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovie(query),
      builder: (context, snapshot) {
        final movie = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movie.length,
          itemBuilder: (BuildContext context, int index) {
            final movies = movie[index];
            return ListTile(
              title: Text(movies.title),
            );
          },
        );
      },
    );
  }
}
