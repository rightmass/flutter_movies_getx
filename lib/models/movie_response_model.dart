import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'movie_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponseModel {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MovieResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MovieResponseModelToJson(this);
}