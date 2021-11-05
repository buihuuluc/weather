import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/slider_dot.dart';
import 'network_api/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/network_api/getdata.dart';
import 'package:weather/network_api/weather.dart';
import 'widgets/single_weather.dart';
class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  String backgImg = 'assets/camau.jpg';

  _onPageChange(int i) {
    setState(() {
      _currentPage = i;
    });
  }

  String background(int _current){

    switch(_current+1) {
      case 1: backgImg = 'assets/camau.jpg'; break;
      case 2: backgImg = 'assets/calgary.jpg'; break;
      case 3: backgImg = 'assets/havana.jpg'; break;
      case 4: backgImg = 'assets/moscow.jpg'; break;
      case 5: backgImg = 'assets/paris.png'; break;
      case 6: backgImg = 'assets/seoul.jpg'; break;
      case 7: backgImg = 'assets/sydney.jpg'; break;
      case 8: backgImg = 'assets/shanghai.jpg'; break;
      case 9: backgImg = 'assets/taiwan.jpg'; break;
      case 10: backgImg = 'assets/tokyo.jpg'; break;
    }
    return backgImg;
  }

  @override
  Widget build(BuildContext context) {
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
                background(_currentPage),
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
                    for (int i = 0; i < 10; i++)
                      if (i == _currentPage)
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
                itemCount: 10,
                itemBuilder: (ctx, i) => SingleWeather(i),
              ),
              //Toan bo thong tin hien thi ben duoi Appbar, Stack = 3
            ],
          ),
        ));
  }
}

