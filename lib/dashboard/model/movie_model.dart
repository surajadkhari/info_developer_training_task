class MovieModel {
  final String movieName;
  final String realeaseDate;
  final String poster;
  final String overView;
  final double rating;

  MovieModel(
      {required this.movieName,
      required this.realeaseDate,
      required this.poster,
      required this.overView,
      required this.rating});

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$poster';
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        movieName: json["title"] ?? "",
        realeaseDate: json["release_date"] ?? "",
        poster: json["poster_path"] ?? "",
        overView: json["overview"] ?? "",
        rating: json["vote_average"].toDouble());
  }
}
