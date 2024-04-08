import 'package:cinemapedia/presentation/provider/storange/favorite_movie_provider.dart';
import 'package:cinemapedia/presentation/widget/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movie = await ref.read(favoriteMovieProvider.notifier).loadNextPage();
    isLoading = false;
    if (movie.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favorite = ref.watch(favoriteMovieProvider).values.toList();

    return Scaffold(
      body: favorite.isEmpty
          ? const Center(child: Text('Sin Favoritos'))
          : MovieMasonry(
              movie: favorite,
              loadNextPage: loadNextPage,
            ),
    );
  }
}
