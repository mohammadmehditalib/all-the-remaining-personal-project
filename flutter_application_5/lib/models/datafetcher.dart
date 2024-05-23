import 'package:json_annotation/json_annotation.dart';

part 'datafetcher.g.dart';

@JsonSerializable()
class Datafetcher {
  Datafetcher();

  late num userId;
  late num id;
  late String title;
  late String body;
  
  factory Datafetcher.fromJson(Map<String,dynamic> json) => _$DatafetcherFromJson(json);
  Map<String, dynamic> toJson() => _$DatafetcherToJson(this);
}
