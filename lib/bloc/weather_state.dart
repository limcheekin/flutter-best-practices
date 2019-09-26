import 'package:equatable/equatable.dart';
import 'package:flutter_best_practices/model/weather.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState([List props = const <dynamic>[]]) : super(props);
}

class InitialWeatherState extends WeatherState {}

class WeatherLoading extends WeatherState {}

// Only the WeatherLoaded event needs to contain data
class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather) : super([weather]);
}
