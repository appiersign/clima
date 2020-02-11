import 'package:http/http.dart' as Http;
import 'dart:convert';

class HttpHelper {
  final url;

  String city;
  int condition;
  int temperature;

  HttpHelper({this.url});

  Future<Map> getData() async {
    Http.Response response = await Http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return {
        'city': data['name'],
        'condition': data['weather'][0]['id'],
        'temperature': data['main']['temp']
      };
    } else {
      print(response.body);
      return {'error': true, 'message': 'something bad happened'};
    }
  }
}
