import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMoviedb movieDetails)=> Movie(
      adult: movieDetails.adult, 
      backdropPath:(movieDetails.backdropPath !='')
      ?'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}'
      :'no-poster', 
      genreIds: movieDetails.genreIds.map((movie) => movie.toString()).toList(), 
      id: movieDetails.id, 
      originalLanguage:movieDetails.originalLanguage, 
      originalTitle: movieDetails.originalTitle, 
      overview: movieDetails.overview, 
      popularity: movieDetails.popularity, 
      posterPath:(movieDetails.posterPath !='')
      ?'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}' 
      :'no-poster', 
      releaseDate: movieDetails.releaseDate, 
      title: movieDetails.title, 
      video: movieDetails.video, 
      voteAverage: movieDetails.voteAverage,
       voteCount: movieDetails.voteCount
       );

       static Movie movieDetailsToEntity(MovieDetails movieDetails)=>Movie(
        adult: movieDetails.adult, 
      backdropPath:(movieDetails.backdropPath !='')
      ?'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}'
      :'no-poster', 
      genreIds: movieDetails.genres.map((movie) => movie.name).toList(), 
      id: movieDetails.id, 
      originalLanguage:movieDetails.originalLanguage, 
      originalTitle: movieDetails.originalTitle, 
      overview: movieDetails.overview, 
      popularity: movieDetails.popularity, 
      posterPath:(movieDetails.posterPath !='')
      ?'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}' 
      :'no-poster', 
      releaseDate: movieDetails.releaseDate, 
      title: movieDetails.title, 
      video: movieDetails.video, 
      voteAverage: movieDetails.voteAverage,
       voteCount: movieDetails.voteCount);
}