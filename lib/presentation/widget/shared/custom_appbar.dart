import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/presentation/delegetes/search_movie_delegete.dart';
import 'package:cinemapedia/presentation/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTitle = Theme.of(context).textTheme.titleLarge;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              const Icon(
                Icons.movie_outlined,
                color: Colors.blueAccent,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'CinemaPedia',
                style: textTitle,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    final movieRepository = ref.read(movieRepositoryProvider);
                    showSearch<Movie?>(
                      context: context,
                      delegate: SearchMovieDelegate(
                          searchMovie: movieRepository.searchMovies),
                    ).then((movie) {
                      if(movie==null)return;
                      context.push('/movie/${movie.id}');
                    });
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
