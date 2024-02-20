import 'package:cinemapedia/infrastructure/dataSources/muviedb_datasources.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider= Provider((ref) => MovieRepositoriImpl(datasources: MoviedbDatasource())); 