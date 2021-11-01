import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather/network_api/weathers.dart';
import '../network_api/jsondecode.dart';
import 'package:http/http.dart' as http;

class Api{
  Future<WeathersApi> getCurrentWeather(String location) async {
    var urlApi = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=1045149251c3f4dee5455194dcdf0c43&units=metric');
    var request = await http.get(urlApi);
    var body = jsonDecode(request.body);

    return WeathersApi.fromJson(body);
  }
}