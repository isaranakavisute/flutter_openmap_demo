// homepage.dart
import 'dart:ffi';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_openmap_demo/serviceApi.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_openmap_demo/current_forecast.dart';
import 'package:flutter_openmap_demo/wholeday_forecast.dart';
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart
// homepage.dart


class Homepage extends StatefulWidget {
  const Homepage({super.key});
  
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController citynameController = TextEditingController();
  final FocusNode focuscityname = FocusNode();
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override

  void initState() {
    super.initState();

    focuscityname.addListener(() {
      // if (focususername.hasFocus)
      //  {if (usernameController.text == "Please enter username" )
      //    usernameController.clear();
      //  }});
      print("textfield focused");
    });
  }

  Future<void> goToCurrentForecast() async {
    print(citynameController.text);
    final weather_obj = await ServiceApi.getCurrentStatus(cityname: citynameController.text, temptype: selectedTemperatureType); 
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

  final List<String> items = [
  'Celcius',
  'Farenheit',
  ];
  String? selectedTemperatureType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final _formKey = GlobalKey<FormState>();
    //static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    return Scaffold(
       appBar: AppBar
       (
         title: Column(children: [
        Text('Open-Weather-Map Demo', style:TextStyle(fontSize: 15, color: Colors.blue)),
        Text('By', style:TextStyle(fontSize: 15, color: Colors.blue)),
        Text('Isara Nakavisute, May 14 2025, 23:38pm', style:TextStyle(fontSize: 15, color: Colors.blue)),
      ]),
        backgroundColor: Colors.amber,
       ),
       body: Form(
        key: _formKey,
        child:
        Center(
        child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        Container(
         padding: const EdgeInsets.all(12),
         margin: const EdgeInsets.only(),
         width: size.width*0.80,
        child: TextFormField
        (
        controller: citynameController,
        focusNode: focuscityname,
        keyboardType: TextInputType.text,
        maxLength: 40,

        // validator: (value) {
        //               if (value == null) {
        //                return 'Please enter the city name';
        //               }
        //               return null;
        //               },

         validator: (value) {
                        print("in textformfield validator");
                        print(value);
                        if (value == "")  {
                         return 'Please enter the city name';
                        }
                        return null;
                        },

        decoration: const InputDecoration(
        border: OutlineInputBorder(), 
         labelText: 'City',
         labelStyle: TextStyle(
         color: Colors.blueGrey,
         fontStyle: FontStyle.italic, fontSize: 20
         ),
        ),
        ),
        ),

         
        


        Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(),
            width: size.width*0.80,
            child: DropdownButtonHideUnderline(
                    // child: DropdownButton2<String> (
                    child: DropdownButtonFormField2<String> (
                        isExpanded: true,

                        validator: (value) {
                        if (value == null) {
                         return 'Please select the type of temperature';
                        }
                        return null;
                        },


                        hint: Text(
                        'Select Type of Temperature',
                         style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                           ),
                        ),
                        items: items.map((String item) => DropdownMenuItem<String>(
                         value: item,
                         child: Text(
                         item,
                        style: const TextStyle(
                         fontSize: 14,
                         ),
                           ),
                        ))
                        .toList(),
                        value: selectedTemperatureType,
                        onChanged: (String? value) {
                         setState(() {
                           selectedTemperatureType = value;
                           print(selectedTemperatureType);
                         });
                        },

                    
                      
                                                   ),
                     ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [

              Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                            onPressed: ()=> {  
                                 if (_formKey.currentState!.validate())
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentForecast(cityname: citynameController.text, temptype: selectedTemperatureType) ) )
                                
                             }, 
                           child: Text('Current Forecast') 
                     ),
                   ),
              Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                                          onPressed: ()=> {  
                                                if (_formKey.currentState!.validate())
                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => WholeDayForecast(cityname: citynameController.text, temptype: selectedTemperatureType) ) )
                              
                                        
                                          }, 
                                          child: Text('Whole-Day Forecast') 
                                         ),
                   ),
            ]
          ),
        ]
       ),
       ),
       ),
       );
    
  }
  
 
}