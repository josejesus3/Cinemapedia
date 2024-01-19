import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDbKey=dotenv.env['THE_MOVIE_KEY']?? 'No hay api Key';
}