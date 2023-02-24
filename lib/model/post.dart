import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

class MyJsonConverter extends JsonConverter<Long, String> {

  const MyJsonConverter();
  @override
  Long fromJson(String json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  String toJson(Long object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}


@JsonSerializable()
class Post extends Equatable {
  @MyJsonConverter()
  late final Long id;
  late final String title;
  late final String? img;
  late final String? description;
  late final String location;
  late final DateTime dateTime;

  Post();
  
  @override
  // TODO: implement props
  List<Object?> get props => [id];

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}