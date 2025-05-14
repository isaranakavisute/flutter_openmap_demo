// current_forecast.dart
import 'dart:ffi';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_openmap_demo/serviceApi.dart';


class CurrentForecast extends StatefulWidget {
  CurrentForecast({super.key, required this.cityname, required this.temptype});
  String? cityname;
  String? temptype;
 
  @override
  State<CurrentForecast> createState() => _CurrentForecastState();
}
class _CurrentForecastState extends State<CurrentForecast> {
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

    goToCurrentForecast();

  }

  

  Future<void> goToCurrentForecast() async {
   

    print(widget.cityname);

    final weather_obj = await ServiceApi.getCurrentStatus(cityname: widget.cityname!, temptype: widget.temptype!); 
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

  Future<void> goToAllDayForecast() async {
    print(citynameController.text);
    final weather_obj = await ServiceApi.getAllDayStatus(cityname: citynameController.text, temptype: ""); 
    print(weather_obj.main?.temp);
    print(weather_obj.main?.feels_like);
    print(weather_obj.main?.temp_min);
    print(weather_obj.main?.temp_max);
    print(weather_obj.main?.pressure);
    print(weather_obj.main?.humidity);
    print(weather_obj.main?.sea_level);
    print(weather_obj.main?.grnd_level);
    
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
   

    return Scaffold(
       appBar: AppBar
       (
        title : const Center(child: Text('Current Forcast')),
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