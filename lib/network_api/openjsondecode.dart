import 'dart:convert';
import 'package:weather/network_api/openweathers.dart';
import 'package:http/http.dart' as http;

class Api{
  Future<WeathersApi> getCurrentWeather(String location) async {
    var urlApi = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8ceacbf04bb9786ff892b1c9866ba982&units=metric');
    var request = await http.get(urlApi);
    var body = jsonDecode(request.body);

    return WeathersApi.fromJson(body);
  }
}