import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Models {
  Models();

  late num id;
  late String title;
  late String description;
  late num price;
  late num discountPercentage;
  late num rating;
  late num stock;
  late String brand;
  late String category;
  late String thumbnail;
  late List images;
  
  factory Models.fromJson(Map<String,dynamic> json) => _$ModelsFromJson(json);
  Map<String, dynamic> toJson() => _$ModelsToJson(this);
}
