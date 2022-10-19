class MovieModel {
  final String movieName;
  final String realeaseDate;
  final String poster;
  final String overView;

  MovieModel({
    required this.movieName,
    required this.realeaseDate,
    required this.poster,
    required this.overView,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        movieName: json["title"],
        realeaseDate: json["release_date"],
        poster: json["poster_path"],
        overView: json["overview"]);
  }
}
