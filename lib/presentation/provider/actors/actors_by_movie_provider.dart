import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/provider/actors/actor_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorMovieProvider =
    StateNotifierProvider<ActorMovieNotifier, Map<String, List<Actor>>>((ref) {
  final fetchMoreMovie = ref.watch(actorRepositoryProvider).getActorsByMovie;
  return ActorMovieNotifier(getActor: fetchMoreMovie);
});
typedef GetActorCallback = Future<List<Actor>> Function(String movieId);

class ActorMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallback getActor;
  ActorMovieNotifier({required this.getActor}) : super({});

  Future<void> loadActor(String muvieId) async {
    if (state[muvieId] != null) return;

    final List<Actor> actors = await getActor(muvieId);
    state = {...state, muvieId: actors};
  }
}
