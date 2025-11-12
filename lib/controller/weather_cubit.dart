
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/data/weather_model.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final Dio dio = Dio();
  final String _apiKey = 'a1e458a8bc8da2ad647febfb07a0edd3';
  final double lat = 29.9816;
  final double lon = 31.2811;

  Future<void> fetchWeather() async {
    emit(WeatherLoading());
    try {
      //my response from api
      final response = await dio.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey');

      final weather = WeatherModel.fromJson(response.data);
      emit(WeatherLoaded(weather));

    } catch (e) {
      emit(WeatherError('error loading weather'));
    } // or
  }
}