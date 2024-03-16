import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorDatasources{
  Future<List<Actor>> getActorsByMovie(String movieId);
}