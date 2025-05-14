import 'package:json_annotation/json_annotation.dart';
// models/geo.dart


part 'geo.g.dart';

@JsonSerializable()
class Geo {
  String? name;
  double? lat;
  double? lon;
  String? country;
  String? state;

  Geo(this.name,this.lat,this.lon,this.country,this.state);

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}