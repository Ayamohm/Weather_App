part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}
final class WeatherBlocking extends WeatherState {}
final class WeatherBlocFailure extends WeatherState {}
final class WeatherBlocSuccess extends WeatherState {}

