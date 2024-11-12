import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:testandroid2/models/user.dart';


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
}