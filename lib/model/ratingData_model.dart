import 'dart:convert';

class RatingOmdbModel {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  List<Rating> ratings;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbId;
  String type;
  String dvd;
  String boxOffice;
  String production;
  String website;
  String response;

  RatingOmdbModel({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.ratings,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.website,
    required this.response,
  });

  RatingOmdbModel copyWith({
    String? title,
    String? year,
    String? rated,
    String? released,
    String? runtime,
    String? genre,
    String? director,
    String? writer,
    String? actors,
    String? plot,
    String? language,
    String? country,
    String? awards,
    String? poster,
    List<Rating>? ratings,
    String? metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbId,
    String? type,
    String? dvd,
    String? boxOffice,
    String? production,
    String? website,
    String? response,
  }) =>
      RatingOmdbModel(
        title: title ?? this.title,
        year: year ?? this.year,
        rated: rated ?? this.rated,
        released: released ?? this.released,
        runtime: runtime ?? this.runtime,
        genre: genre ?? this.genre,
        director: director ?? this.director,
        writer: writer ?? this.writer,
        actors: actors ?? this.actors,
        plot: plot ?? this.plot,
        language: language ?? this.language,
        country: country ?? this.country,
        awards: awards ?? this.awards,
        poster: poster ?? this.poster,
        ratings: ratings ?? this.ratings,
        metascore: metascore ?? this.metascore,
        imdbRating: imdbRating ?? this.imdbRating,
        imdbVotes: imdbVotes ?? this.imdbVotes,
        imdbId: imdbId ?? this.imdbId,
        type: type ?? this.type,
        dvd: dvd ?? this.dvd,
        boxOffice: boxOffice ?? this.boxOffice,
        production: production ?? this.production,
        website: website ?? this.website,
        response: response ?? this.response,
      );

  factory RatingOmdbModel.fromRawJson(String str) => RatingOmdbModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RatingOmdbModel.fromJson(Map<String, dynamic> json) => RatingOmdbModel(
    title: json["Title"],
    year: json["Year"],
    rated: json["Rated"],
    released: json["Released"],
    runtime: json["Runtime"],
    genre: json["Genre"],
    director: json["Director"],
    writer: json["Writer"],
    actors: json["Actors"],
    plot: json["Plot"],
    language: json["Language"],
    country: json["Country"],
    awards: json["Awards"],
    poster: json["Poster"],
    ratings: List<Rating>.from(json["Ratings"].map((x) => Rating.fromJson(x))),
    metascore: json["Metascore"],
    imdbRating: json["imdbRating"],
    imdbVotes: json["imdbVotes"],
    imdbId: json["imdbID"],
    type: json["Type"],
    dvd: json["DVD"],
    boxOffice: json["BoxOffice"],
    production: json["Production"],
    website: json["Website"],
    response: json["Response"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "Rated": rated,
    "Released": released,
    "Runtime": runtime,
    "Genre": genre,
    "Director": director,
    "Writer": writer,
    "Actors": actors,
    "Plot": plot,
    "Language": language,
    "Country": country,
    "Awards": awards,
    "Poster": poster,
    "Ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    "Metascore": metascore,
    "imdbRating": imdbRating,
    "imdbVotes": imdbVotes,
    "imdbID": imdbId,
    "Type": type,
    "DVD": dvd,
    "BoxOffice": boxOffice,
    "Production": production,
    "Website": website,
    "Response": response,
  };
}

class Rating {
  String source;
  String value;

  Rating({
    required this.source,
    required this.value,
  });

  Rating copyWith({
    String? source,
    String? value,
  }) =>
      Rating(
        source: source ?? this.source,
        value: value ?? this.value,
      );

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    source: json["Source"],
    value: json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "Source": source,
    "Value": value,
  };
}
