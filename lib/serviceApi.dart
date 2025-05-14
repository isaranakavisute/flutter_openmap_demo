import 'dart:convert';
import 'dart:developer';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_openmap_demo/models/geo.dart';
import 'package:flutter_openmap_demo/models/user.dart';
import 'package:flutter_openmap_demo/models/weather.dart';
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
//import 'package:http/https.dart' as https;
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart
// serviceApi.dart



class ServiceApi {
  const ServiceApi();

  static Future<User> getLoginStatus(
      {required String username,
      required String password,
      }) async {
    //final url = Uri.http('pus2.thailandpost.com', 'que/qprint');
    print(username);
    print(password);
    final url = Uri.parse('http://192.168.0.156/backend1.php');
    final response = await http.post(url,
        //headers: {'Content-Type': 'application/json'},
        body: /*jsonEncode({
          'username': username,
          'password': password,
        })*/

        {
         'username': username,
         'password': password
        }
        
        
        
        );
    final data = convert.jsonDecode(response.body);
    return User.fromJson(data);
  }

   //static Future<Geo> getCurrentStatus(
   static Future<Weather> getCurrentStatus(
      {required String cityname, required String? temptype }) async {
    print(cityname);
    print("in service api");
    print(temptype);
    var city_country = cityname+",TH";
    print(city_country);
    var appid = "1e51d979d552c494b2058701c7b41467";
    //final url = Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=Bangkok,TH&appid=1e51d979d552c494b2058701c7b41467');
    var geo_url = Uri.http("api.openweathermap.org", "/geo/1.0/direct", {"q":city_country,"appid":appid});
    final geo_response = await http.get(geo_url);
    final geo_data = convert.jsonDecode(geo_response.body);
    //print(data);
    //print(data[0]);
    Geo geo_obj = Geo.fromJson(geo_data[0]);
    //print(geo_obj.name);
    print(geo_obj.lat);
    print(geo_obj.lon);
    //https://api.openweathermap.org/data/2.5/weather?lat=13.7524938&lon=100.4935089&appid=1e51d979d552c494b2058701c7b41467&units=imperial
    var weather_url;
    if (temptype=="Farenheit")
     weather_url = Uri.http("api.openweathermap.org", "/data/2.5/weather", {"lat":geo_obj.lat.toString(),"lon":geo_obj.lon.toString(),"appid":appid,"units":"imperial"});
    else
     weather_url = Uri.http("api.openweathermap.org", "/data/2.5/weather", {"lat":geo_obj.lat.toString(),"lon":geo_obj.lon.toString(),"appid":appid,"units":"metric"});
    final weather_response = await http.get(weather_url);
    final weather_data = convert.jsonDecode(weather_response.body);
    Weather weather_obj = Weather.fromJson(weather_data);
    print("---");
    // print(weather_obj.main?.temp);
    // print(weather_obj.main?.feels_like);
    // print(weather_obj.main?.temp_min);
    // print(weather_obj.main?.temp_max);
    // print(weather_obj.main?.pressure);
    // print(weather_obj.main?.humidity);
    // print(weather_obj.main?.sea_level);
    // print(weather_obj.main?.grnd_level);
    return weather_obj;
    //print(weather_data.main);
    //return Geo.fromJson(data[0]);
  }

  static Future<Weather> getAllDayStatus(
     {required String cityname,required String? temptype}) async {
    print(cityname);
    var city_country = cityname+",TH";
    print(city_country);
    var appid = "1e51d979d552c494b2058701c7b41467";
    //final url = Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=Bangkok,TH&appid=1e51d979d552c494b2058701c7b41467');
    var geo_url = Uri.http("api.openweathermap.org", "/geo/1.0/direct", {"q":city_country,"appid":appid});
    final geo_response = await http.get(geo_url);
    final geo_data = convert.jsonDecode(geo_response.body);
    //print(data);
    //print(data[0]);
    Geo geo_obj = Geo.fromJson(geo_data[0]);
    //print(geo_obj.name);
    print(geo_obj.lat);
    print(geo_obj.lon);
    //https://api.openweathermap.org/data/2.5/weather?lat=13.7524938&lon=100.4935089&appid=1e51d979d552c494b2058701c7b41467&units=imperial
    var weather_url;
    if (temptype=="Farenheit")
     weather_url = Uri.http("api.openweathermap.org", "/data/2.5/weather", {"lat":geo_obj.lat.toString(),"lon":geo_obj.lon.toString(),"appid":appid,"units":"imperial"});
    else
     weather_url = Uri.http("api.openweathermap.org", "/data/2.5/weather", {"lat":geo_obj.lat.toString(),"lon":geo_obj.lon.toString(),"appid":appid,"units":"metric"});
    final weather_response = await http.get(weather_url);
    final weather_data = convert.jsonDecode(weather_response.body);
    Weather weather_obj = Weather.fromJson(weather_data);
    print("---");
    // print(weather_obj.main?.temp);
    // print(weather_obj.main?.feels_like);
    // print(weather_obj.main?.temp_min);
    // print(weather_obj.main?.temp_max);
    // print(weather_obj.main?.pressure);
    // print(weather_obj.main?.humidity);
    // print(weather_obj.main?.sea_level);
    // print(weather_obj.main?.grnd_level);
    //print(weather_data.main);
    //return Geo.fromJson(data[0]);
    return weather_obj;
  }


   



}