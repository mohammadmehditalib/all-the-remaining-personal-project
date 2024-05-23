// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datafetcher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datafetcher _$DatafetcherFromJson(Map<String, dynamic> json) => Datafetcher()
  ..userId = json['userId'] as num
  ..id = json['id'] as num
  ..title = json['title'] as String
  ..body = json['body'] as String;

Map<String, dynamic> _$DatafetcherToJson(Datafetcher instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
