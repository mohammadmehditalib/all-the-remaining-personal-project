// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast()
  ..maxtemp_c = json['maxtemp_c'] as num
  ..maxtemp_f = json['maxtemp_f'] as num
  ..mintemp_c = json['mintemp_c'] as num
  ..mintemp_f = json['mintemp_f'] as num
  ..avgtemp_c = json['avgtemp_c'] as num
  ..avgtemp_f = json['avgtemp_f'] as num
  ..maxwind_mph = json['maxwind_mph'] as num
  ..maxwind_kph = json['maxwind_kph'] as num
  ..totalprecip_mm = json['totalprecip_mm'] as num
  ..totalprecip_in = json['totalprecip_in'] as num
  ..totalsnow_cm = json['totalsnow_cm'] as num
  ..avgvis_km = json['avgvis_km'] as num
  ..avgvis_miles = json['avgvis_miles'] as num
  ..avghumidity = json['avghumidity'] as num
  ..daily_will_it_rain = json['daily_will_it_rain'] as num
  ..daily_chance_of_rain = json['daily_chance_of_rain'] as num
  ..daily_will_it_snow = json['daily_will_it_snow'] as num
  ..daily_chance_of_snow = json['daily_chance_of_snow'] as num
  ..condition = json['condition'] as Map<String, dynamic>;

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'maxtemp_c': instance.maxtemp_c,
      'maxtemp_f': instance.maxtemp_f,
      'mintemp_c': instance.mintemp_c,
      'mintemp_f': instance.mintemp_f,
      'avgtemp_c': instance.avgtemp_c,
      'avgtemp_f': instance.avgtemp_f,
      'maxwind_mph': instance.maxwind_mph,
      'maxwind_kph': instance.maxwind_kph,
      'totalprecip_mm': instance.totalprecip_mm,
      'totalprecip_in': instance.totalprecip_in,
      'totalsnow_cm': instance.totalsnow_cm,
      'avgvis_km': instance.avgvis_km,
      'avgvis_miles': instance.avgvis_miles,
      'avghumidity': instance.avghumidity,
      'daily_will_it_rain': instance.daily_will_it_rain,
      'daily_chance_of_rain': instance.daily_chance_of_rain,
      'daily_will_it_snow': instance.daily_will_it_snow,
      'daily_chance_of_snow': instance.daily_chance_of_snow,
      'condition': instance.condition,
    };
