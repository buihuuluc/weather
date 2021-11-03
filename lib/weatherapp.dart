import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/slider_dot.dart';
import 'network_api/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/network_api/getdata.dart';
import 'package:weather/network_api/weather.dart';

class WeatherApp extends StatefulWidget {

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  int _currentPage = 0;
  String backgImg = 'assets/sunny.jpg';

  _onPageChange(int i){
    setState(() {
      _currentPage = i;
    });
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
                itemCount: 6,
                itemBuilder: (ctx, i) => SingleWeather(i),
              ),
              //Toan bo thong tin hien thi ben duoi Appbar, Stack = 3
            ],
          ),
        ));
  }
}

class SingleWeather extends StatefulWidget {
  final int index;
  SingleWeather(this.index);
  @override
  State<SingleWeather> createState() => _SingleWeatherState();
}

class _SingleWeatherState extends State<SingleWeather> {
  String name;
  Weather weathersDisplay = new Weather();
  GetData client = GetData();
  var today = new DateTime.now();
  //var fiftyDaysFromNow = DateFormat('dd-MM-yyyy','en_US').add_H(1);

  Future<void> getWeather() async {
    weathersDisplay = await client.getCurrentWeather(name);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.index == 0) {
      name = 'Hanoi';
    } else if (widget.index == 1) {
      name = 'London';
    } else if (widget.index == 2) {
      name = 'Tokyo';
    } else if (widget.index == 3) {
      name = 'Sydney';
    } else if (widget.index == 4) {
      name = 'Delhi';
    } else if (widget.index == 5) {
      name = 'Beijing';
    } else if (widget.index == 6) {
      name = 'Osaka';
    }

    return FutureBuilder<void>(
      future: getWeather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            //Hien thi Ten thanh pho, Thoi gian, Nhiet do, Daylight, Day phan cach, Rain, Wind...
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Ten thanh pho, thoi gian, nhiet do, daylight
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Ten thanh pho, thoi gian
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          //Ten Thanh Pho
                          Text(
                            weathersDisplay.name.toString(),
                            style: GoogleFonts.beVietnam(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //Thoi gian
                          Text(
                            //DateFormat().format(now),
                            weathersDisplay.localtime.toString(),
                            style: GoogleFonts.beVietnam(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //3 ngay tiep theo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(0, 154, 205, 0.4),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              height: 200,
                              width: 180,
                              child: Column(
                                children: [
                                  Text(
                                    'Yesterday',
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(204, 85, 0, 0.4),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              height: 200,
                              width: 180,
                              child: Column(
                                children: [
                                  Text(
                                    'Không Khí',
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Co2',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          weathersDisplay.co.toStringAsFixed(1),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'ppm',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      //Nhiet do, daylight
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Nhiet Do
                          Text(
                            weathersDisplay.temp_c.toString() + '\u2103',
                            style: GoogleFonts.beVietnam(
                                fontSize: 68,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          //Daylight
                          Row(
                            children: [
                              Image.network(
                                'https:' + weathersDisplay.icon,
                                height: 30,
                                width: 34,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                weathersDisplay.text.toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Day phan cach va Wind, Rain, Dum
                Column(
                  children: [
                    //Lan phan cach
                    Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30),
                      ),
                    ),
                    //Wind, Rain, Humidity
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Tốc độ gió',
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Text(weathersDisplay.wind.toString(),
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('km/h',
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Stack(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 5,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width: weathersDisplay.wind.toDouble(),
                                      height: 5,
                                      color: Colors.blueAccent,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('Độ Gió',
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Text(weathersDisplay.winddegree.toString(),
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('°',
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Stack(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 5,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width: weathersDisplay.winddegree
                                          .toDouble() /
                                          2,
                                      height: 5,
                                      color: Colors.redAccent,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('Độ Ẩm',
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Text(weathersDisplay.humidity.toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('%',
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Stack(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 5,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width:
                                      weathersDisplay.humidity.toDouble() /
                                          2,
                                      height: 5,
                                      color: Colors.yellowAccent,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        }

        return Container(
          color: Colors.redAccent,
          width: double.infinity,
          height: double.infinity,
        );
      },
    );
  }
}

