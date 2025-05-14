// wholeday_forecast.dart
import 'dart:ffi';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_openmap_demo/serviceApi.dart';

class WholeDayForecast extends StatefulWidget {
  WholeDayForecast({super.key, required this.cityname,required this.temptype});
  String? cityname;
  String? temptype;

  @override
  State<WholeDayForecast> createState() => _WholeDayForecastState();
}

class _WholeDayForecastState extends State<WholeDayForecast> {
  final TextEditingController citynameController = TextEditingController();
  String? temp;
  String? feels_like;
  String? temp_min;
  String? temp_max;
  String? pressure;
  String? humidity;
  String? sea_level;
  String? grnd_level;

  @override
  void initState() {
    super.initState();

    goToAllDayForecast();
  }


  Future<void> goToCurrentForecast() async {
    print(citynameController.text);
    final weather_obj = await ServiceApi.getCurrentStatus(cityname: citynameController.text, temptype: ""); 
    print(weather_obj.main?.temp);
    print(weather_obj.main?.feels_like);
    print(weather_obj.main?.temp_min);
    print(weather_obj.main?.temp_max);
    print(weather_obj.main?.pressure);
    print(weather_obj.main?.humidity);
    print(weather_obj.main?.sea_level);
    print(weather_obj.main?.grnd_level);
  }

  Future<void> goToAllDayForecast() async {
    print(widget.cityname);
    final weather_obj = await ServiceApi.getAllDayStatus(cityname: widget.cityname!,temptype: widget.temptype!); 
    print(weather_obj.main?.temp);
    print(weather_obj.main?.feels_like);
    print(weather_obj.main?.temp_min);
    print(weather_obj.main?.temp_max);
    print(weather_obj.main?.pressure);
    print(weather_obj.main?.humidity);
    print(weather_obj.main?.sea_level);
    print(weather_obj.main?.grnd_level);

    setState(() {
        temp = weather_obj.main?.temp.toString();
        feels_like = weather_obj.main?.feels_like.toString();
        temp_min = weather_obj.main?.temp_min.toString();
        temp_max = weather_obj.main?.temp_max.toString();
        pressure = weather_obj.main?.pressure.toString();
        humidity = weather_obj.main?.humidity.toString();
        sea_level = weather_obj.main?.sea_level.toString();
        grnd_level = weather_obj.main?.grnd_level.toString();
      });

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
   

    return Scaffold(
       appBar: AppBar
       (
        title : const Center(child: Text('Whole Day Forcast')),
        backgroundColor: Colors.amber,
       ),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("TEMP",style:TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(temp.toString(),style:TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                ]
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("FEELS_LIKE",style:TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(feels_like.toString(),style:TextStyle(fontSize: 20, color: Colors.blue))
                  ),
                ]
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("TEMP_MIN",style:TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(temp_min.toString(),style:TextStyle(fontSize: 20, color: Colors.blue))
                  ),
                ]
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("TEMP_MAX",style:TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  Text(temp_max.toString(),style:TextStyle(fontSize: 20, color: Colors.blue))
                  ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                     Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  Text("PRESSURE",style:TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  Text(pressure.toString(),style:TextStyle(fontSize: 20, color: Colors.blue))
                  ),
                ]
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("HUMIDITY",style:TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(humidity.toString(),style:TextStyle(fontSize: 20, color: Colors.blue))
                  ),
                ]
              ),
          ]
        )
       )
       );
    
  }
  
 
}