import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMoviedb moviedb)=> Movie(
      adult: moviedb.adult, 
      backdropPath:(moviedb.backdropPath !='')
      ?'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      :'https://easimages.basnop.com/default-image_600.png', 
      genreIds: moviedb.genreIds.map((movie) => movie.toString()).toList(), 
      id: moviedb.id, 
      originalLanguage:moviedb.originalLanguage, 
      originalTitle: moviedb.originalTitle, 
      overview: moviedb.overview, 
      popularity: moviedb.popularity, 
      posterPath:(moviedb.posterPath !='')
      ?'https://image.tmdb.org/t/p/w500${moviedb.posterPath}' 
      :'no-poster', 
      releaseDate: moviedb.releaseDate, 
      title: moviedb.title, 
      video: moviedb.video, 
      voteAverage: moviedb.voteAverage,
       voteCount: moviedb.voteCount
       );
}