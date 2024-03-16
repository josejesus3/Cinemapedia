import 'package:cinemapedia/infrastructure/dataSources/actor_movidb_datasources.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository.impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(actorDatasources: ActorMoviedbDataSources());
});
