import 'package:json_annotation/json_annotation.dart';

part 'languages.g.dart';

@JsonSerializable()
class Languages {
  Languages();

  late num userId;
  late num id;
  late String title;
  late String body;
  
  factory Languages.fromJson(Map<String,dynamic> json) => _$LanguagesFromJson(json);
  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}
