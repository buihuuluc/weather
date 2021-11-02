import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/single_weather.dart';
import '../models/weather_location.dart';
import 'widgets/slider_dot.dart';
import 'network_api/weather.dart';

class WeatherApp extends StatefulWidget {

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  int _currentPage = 0;
  String backgImg = '';

  _onPageChange(int i){
    setState(() {
      _currentPage = i;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(locationList[_currentPage].weatherType == 'Night'){
      backgImg = 'assets/night.jpg';
    }else if(locationList[_currentPage].weatherType == 'Cloudy'){
      backgImg = 'assets/cloudy.jpeg';
    }else if(locationList[_currentPage].weatherType == 'Sunny'){
      backgImg = 'assets/sunny.jpg';
    }else if(locationList[_currentPage].weatherType == 'Rainy'){
      backgImg = 'assets/rainy.jpg';
    }else if(locationList[_currentPage].weatherType == 'Rainy'){
      backgImg = 'assets/rainy.jpg';
    }else if(locationList[_currentPage].weatherType == 'Rainy'){
      backgImg = 'assets/rainy.jpg';
    }
    return Scaffold(
        extendBodyBehindAppBar: true, //View through Appbar
        appBar: AppBar(
          toolbarHeight: 40,
          title: Text(''),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: GestureDetector(
                  onTap: () => print('Menu Clicked'),
                  child: SvgPicture.asset('assets/menu.svg',
                      height: 30, width: 30, color: Colors.white)),
            )
          ],
          backgroundColor: Colors.transparent, // Transparent Appbar
          elevation: 0.0, //Remove Shadow of AppBar in Android
        ),
        body: Container(
          child: Stack(
            children: [
              //Background Image, Stack = 1
              Image.asset(
                backgImg,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              //Lop phu den, Stack = 2
              Container(
                decoration: BoxDecoration(color: Colors.black26),
              ),
              //Silder sang trang
              Container(
                margin: EdgeInsets.only(top: 92, left: 15),
                child: Row(
                  children: [
                    for(int i=0; i<6; i++)
                      if( i == _currentPage)
                      SliderDot(true)
                    else
                      SliderDot(false)
                  ],
                ),
              ),
              //Build view page
              PageView.builder(
                onPageChanged: _onPageChange,
                scrollDirection: Axis.horizontal,
                itemCount: locationList.length,
                itemBuilder: (ctx, i) => SingleWeather(i),
              ),
              //Toan bo thong tin hien thi ben duoi Appbar, Stack = 3
            ],
          ),
        ));
  }
}
