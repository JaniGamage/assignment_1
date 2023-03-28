// To parse this JSON data, do
//
//     final getFilmDataModel = getFilmDataModelFromJson(jsonString);

import 'dart:convert';

GetFilmDataModel getFilmDataModelFromJson(String str) => GetFilmDataModel.fromJson(json.decode(str));

String getFilmDataModelToJson(GetFilmDataModel data) => json.encode(data.toJson());

class GetFilmDataModel {
  GetFilmDataModel({
     this.search,
     this.totalResults,
     this.response,
  });

  List<Search>? search;
  String? totalResults;
  String? response;

  factory GetFilmDataModel.fromJson(Map<String, dynamic> json) => GetFilmDataModel(
    search: List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
    totalResults: json["totalResults"],
    response: json["Response"],
  );


  Map<String, dynamic> toJson() => {
    "Search": List<dynamic>.from(search!.map((x) => x.toJson())),
    "totalResults": totalResults,
    "Response": response,
  };
}

 class Search {
  Search({
    required this.title,
    required this.year,
    this.imdbId,
    this.type,
    required this.poster,
  });

  final String title;
  final String year;
  final String? imdbId;
  final Type? type;
  final String poster;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    title: json["Title"],
    year: json["Year"],
    imdbId: json["imdbID"],
    type: typeValues.map[json["Type"]],
    poster: json["Poster"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "imdbID": imdbId,
    "Type": typeValues.reverse[type],
    "Poster": poster,
  };
}

enum Type { MOVIE, SERIES }

final typeValues = EnumValues({
  "movie": Type.MOVIE,
  "series": Type.SERIES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
