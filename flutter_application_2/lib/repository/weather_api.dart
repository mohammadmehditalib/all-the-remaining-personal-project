import 'dart:convert';
import 'dart:isolate';
import 'package:flutter_application_2/models/index.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future hittingApiforCurrentWeatherConditions(String cityName) async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=cc1b4b1295b6490194093145241803&q=${cityName}&aqi=no'));
      if (response.statusCode == 200) {
        print(response.body);
        final data = Models.fromJson(jsonDecode(response.body)['current']);
        print(data);
        return data;
      } else {
        print(response.body);
        return 'error';
      }
    } catch (e) {
      return e;
    }
  }

  Future hittingApiforFutureWeatherConditions(String cityName) async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=cc1b4b1295b6490194093145241803&q=${cityName}&aqi=no'));
      if (response.statusCode == 200) {
        print(response.body);
        final data =
            Forecast.fromJson(jsonDecode(response.body)['forecast']['forecastday'][0]['day']);

        print(data);
        return data;
      } else {
        return 'error';
      }
    } catch (e) {
      return e;
    }
  }
}
