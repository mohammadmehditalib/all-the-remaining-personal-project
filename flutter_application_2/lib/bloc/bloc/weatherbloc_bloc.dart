import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/bloc/bloc/bloc/database_bloc.dart';
import 'package:flutter_application_2/models/index.dart';
import 'package:flutter_application_2/repository/weather_api.dart';
import 'package:flutter_application_2/services/database.dart';
import 'package:meta/meta.dart';

part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherblocBloc extends Bloc<WeatherblocEvent, WeatherblocState> {
  WeatherblocBloc() : super(WeatherblocInitial()) {
    on<WeatherblocfetchingEvent>((event, emit) {
      weatherApiCalling(event.inputText);
    });
    on<WeatherblocInitialEvent>((event, emit) {
      emit(WeatherblocInitial());
    });
  }

  void weatherApiCalling(String cityName) async {
     
    



    emit(Weatherblocfetching());
    
    final data = await WeatherApi().hittingApiforCurrentWeatherConditions(cityName);
    if (data == 'error') {
      emit(WeatherblocfetchingError());
    } else {
      final data1 = await WeatherApi().hittingApiforFutureWeatherConditions(cityName);
      if (data1 == 'error') {
        emit(WeatherblocfetchingError());
      } else {
        print(data);
        print(data1);

        //await DataBaseHelper.insert(data, data1);

        emit(Weatherblocfetched(
            currentTemp: data.temp_c,
            humidity: data.humidity,
            maxTemp: data1.maxtemp_c,
            minTemp: data1.mintemp_c,
            windSpeed: data.wind_kph,
            image: data.condition['icon']));
      }
    }
  }
}
