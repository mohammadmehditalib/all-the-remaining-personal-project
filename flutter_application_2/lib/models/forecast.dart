import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  Forecast();

  late num maxtemp_c;
  late num maxtemp_f;
  late num mintemp_c;
  late num mintemp_f;
  late num avgtemp_c;
  late num avgtemp_f;
  late num maxwind_mph;
  late num maxwind_kph;
  late num totalprecip_mm;
  late num totalprecip_in;
  late num totalsnow_cm;
  late num avgvis_km;
  late num avgvis_miles;
  late num avghumidity;
  late num daily_will_it_rain;
  late num daily_chance_of_rain;
  late num daily_will_it_snow;
  late num daily_chance_of_snow;
  late Map<String,dynamic> condition;
  
  factory Forecast.fromJson(Map<String,dynamic> json) => _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
