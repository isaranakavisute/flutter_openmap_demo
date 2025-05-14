// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Geo _$GeoFromJson(Map<String, dynamic> json) => Geo(
      json['name'] as String?,
      (json['lat'] as num?)?.toDouble(),
      (json['lon'] as num?)?.toDouble(),
      json['country'] as String?,
      json['state'] as String?,
    );

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
    };
