import 'package:json_annotation/json_annotation.dart';
// models/main.dart
// models/mymain.dart
// models/mymain.dart
// models/mymain.dart
// models/mymain.dart
// models/mymain.dart
// models/mymain.dart
// models/mymain.dart

part 'main.g.dart';

@JsonSerializable()
 class Main {
       double? temp;
       double? feels_like;
       double? temp_min;
       double? temp_max;
       double? pressure;
       double? humidity;
       double? sea_level;
       double? grnd_level;


       Main(this.temp, this.feels_like, this.temp_min, this.temp_max, this.pressure, this.humidity, this.sea_level, this.grnd_level);
       factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
       Map<String, dynamic> toJson() => _$MainToJson(this);
 }




