import 'package:cinemapedia/infrastructure/dataSources/isar_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/local_storange_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorangeProvider =
    Provider((ref) => LocalStorangeImpl(datasource: IsarDatasource()));
