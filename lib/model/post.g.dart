// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post()
  ..id = const MyJsonConverter().fromJson(json['id'] as String)
  ..title = json['title'] as String
  ..img = json['img'] as String?
  ..description = json['description'] as String?
  ..location = json['location'] as String
  ..dateTime = DateTime.parse(json['dateTime'] as String);

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': const MyJsonConverter().toJson(instance.id),
      'title': instance.title,
      'img': instance.img,
      'description': instance.description,
      'location': instance.location,
      'dateTime': instance.dateTime.toIso8601String(),
    };
