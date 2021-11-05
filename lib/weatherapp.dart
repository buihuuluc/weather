import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/widgets/homepage.dart';
import 'widgets/aqipage.dart';
import 'widgets/search.dart';

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
              onPressed: () {
                
              },
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
            actions: [
              // Container(
              //   margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              //   child: GestureDetector(
              //       onTap: () => print('Menu Clicked'),
              //       child: SvgPicture.asset('assets/menu.svg',
              //           height: 30, width: 30, color: Colors.white)),
              // )
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SearchScreen()
                    ));
                  },
                  child: SvgPicture.asset(
                    'assets/Search.svg',
                    height: 30,
                    width: 30,
                    color: Colors.white,
                  ),
                ),
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
              AQIPage(),
            ],
          ),
        ),
      )
    );
  }


}

