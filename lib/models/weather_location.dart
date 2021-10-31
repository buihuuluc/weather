import 'package:flutter/material.dart';

class WeatherLocation {
  final String city;
  final String dateTime;
  final String temperature;
  final String weatherType;
  final String iconUrl;
  final int wind;
  final int rain;
  final int humidity;

  WeatherLocation({
    this.city,
    this.dateTime,
    this.temperature,
    this.weatherType,
    this.iconUrl,
    this.wind,
    this.rain,
    this.humidity,
  });
}
  final locationList = [
    WeatherLocation(
      city: 'Ca Mau',
      dateTime: '11:00 PM - Saturday, 30 Oct 2021',
      temperature: '25\u2103',
      weatherType: 'Night',
      iconUrl: 'assets/moon.svg',
      wind: 5,
      rain: 8,
      humidity: 82,
    ),
    WeatherLocation(
      city: 'Hue',
      dateTime: '11:00 PM - Saturday, 30 Oct 2021',
      temperature: '27\u2103',
      weatherType: 'Cloudy',
      iconUrl: 'assets/cloudy.svg',
      wind: 12,
      rain: 19,
      humidity: 43,
    ),
    WeatherLocation(
      city: 'Tp Ho Chi Minh',
      dateTime: '11:00 PM - Saturday, 30 Oct 2021',
      temperature: '20\u2103',
      weatherType: 'Rainy',
      iconUrl: 'assets/rain.svg',
      wind: 9,
      rain: 32,
      humidity: 11,
    ),
    WeatherLocation(
      city: 'Ha Noi',
      dateTime: '21:00 PM - Saturday, 30 Oct 2021',
      temperature: '25\u2103',
      weatherType: 'Sunny',
      iconUrl: 'assets/sun.svg',
      wind: 19,
      rain: 3,
      humidity: 40,
    ),
  ];



