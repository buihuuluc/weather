import 'dart:convert';
import '../network_api/weather.dart';
import 'package:http/http.dart' as http;

class GetData{
  Future<Weather> getCurrentWeather(String location) async {
    var urlApi = Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=da1d665b6e0143f39be85704210211&q=$location&days=1&aqi=yes&alerts=no');
    var request = await http.get(urlApi);
    var body = jsonDecode(request.body);

    return Weather.fromJson(body);
  }
}