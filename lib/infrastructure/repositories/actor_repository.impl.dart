import 'package:cinemapedia/domain/datasources/actor_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actor_repository.dart';

class ActorRepositoryImpl extends ActorRepository{
  final ActorDatasources actorDatasources;

  ActorRepositoryImpl({required this.actorDatasources});
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorDatasources.getActorsByMovie(movieId);
    
  }

}