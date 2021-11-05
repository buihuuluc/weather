import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/widgets/homepage.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: true, //View through Appbar
          appBar: AppBar(
            toolbarHeight: 36,
            title: Text(''),
            leading: IconButton(
              onPressed: () => print('Search icon clicked'),
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
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.cloud,)),
                Tab(icon: Icon(Icons.wb_sunny,)),
              ],
            ),
            backgroundColor: Colors.transparent, // Transparent Appbar
            elevation: 0.0, //Remove Shadow of AppBar in Android
          ),
          body: TabBarView(
            children: [
              HomePage(),
              Container(color: Colors.deepOrangeAccent,),
            ],
          ),
        ),
      )
    );
  }


}

