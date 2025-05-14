// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      (json['temp'] as num?)?.toDouble(),
      (json['feels_like'] as num?)?.toDouble(),
      (json['temp_min'] as num?)?.toDouble(),
      (json['temp_max'] as num?)?.toDouble(),
      (json['pressure'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toDouble(),
      (json['sea_level'] as num?)?.toDouble(),
      (json['grnd_level'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.sea_level,
      'grnd_level': instance.grnd_level,
    };
