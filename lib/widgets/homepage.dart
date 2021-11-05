import 'package:flutter/material.dart';
import '../widgets/slider_dot.dart';
import '../widgets/single_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPage = 0;
  String backgImg = '';

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
    return  Container(
      child: Stack(
        children: [
          //Background Image
          Image.asset(
            background(_currentPage),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          //Lop phu den
          Container(
            decoration: BoxDecoration(color: Colors.black26),
          ),
          //Silder sang trang
          Container(
            margin: EdgeInsets.only(top: 130, left: 15),
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
    );
  }
}
