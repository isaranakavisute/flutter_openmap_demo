import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_openmap_demo/models/main.dart';
// models/weather.dart
// models/weather.dart
// models/weather.dart
// models/weather.dart
// models/weather.dart
// models/weather.dart
// models/weather.dart
// models/weather.dart

part 'weather.g.dart';

@JsonSerializable()

 
class Weather {
  Main? main;

  Weather(this.main);

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}