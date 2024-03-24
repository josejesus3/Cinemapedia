import 'package:cinemapedia/presentation/screen/screen.dart';
import 'package:cinemapedia/presentation/screen/views/movies/favorites_view.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeScreen(childView: child),
      routes: [
        GoRoute(
          path: '/',
          name: HomeScreen.name,
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
                path: 'movie/:id',
                name: MovieScreen.name,
                builder: (context, state) {
                  final movieId = state.pathParameters['id'] ?? 'no-id';
                  return MovieScreen(
                    movieId: movieId,
                  );
                }),
          ],
        ),
        GoRoute(
          path: '/Favorites',
          builder: (context, state) => const FavoritesView(),
        )
      ],
    )
  ],
);
