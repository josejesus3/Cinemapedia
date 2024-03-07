import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieDbResponse {
  final Dates? dates;
  final int page;
  final List<MovieMoviedb> result;
  final int totalPages;
  final int totalMovieMoviedbs;

  MovieDbResponse({
    required this.dates,
    required this.page,
    required this.result,
    required this.totalPages,
    required this.totalMovieMoviedbs,
  });

  factory MovieDbResponse.fromJson(Map<String, dynamic> json) =>
      MovieDbResponse(
        dates: json['dates'] != null ? Dates.fromJson(json["dates"]) : null,
        page: json["page"],
        result: List<MovieMoviedb>.from(json["results"].map((x) => MovieMoviedb.fromJson(x))),
        totalPages: json["total_pages"],
        totalMovieMoviedbs: json['total_result'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(), 
        "page": page,
        "results": List<dynamic>.from(result.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalMovieMoviedbs,
      };
}

class Dates {
  final DateTime maximum;
  final DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
