import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Models {
  Models();

  late num last_updated_epoch;
  late String last_updated;
  late num temp_c;
  late num temp_f;
  late num is_day;
  late Map<String,dynamic> condition;
  late num wind_mph;
  late num wind_kph;
  late num wind_degree;
  late String wind_dir;
  late num pressure_mb;
  late num pressure_in;
  late num precip_mm;
  late num precip_in;
  late num humidity;
  late num cloud;
  late num feelslike_c;
  late num feelslike_f;
  late num vis_km;
  late num vis_miles;
  late num uv;
  late num gust_mph;
  late num gust_kph;
  
  factory Models.fromJson(Map<String,dynamic> json) => _$ModelsFromJson(json);
  Map<String, dynamic> toJson() => _$ModelsToJson(this);
}
