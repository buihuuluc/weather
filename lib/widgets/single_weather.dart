import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/network_api/getdata.dart';
import 'package:weather/network_api/weather.dart';
import 'package:tiengviet/tiengviet.dart';

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
      name = 'Ca-mau';
    } else if (widget.index == 1) {
      name = 'Bac-lieu';
    } else if (widget.index == 2) {
      name = 'Soc-trang';
    } else if (widget.index == 3) {
      name = 'Can-tho';
    } else if (widget.index == 4) {
      name = 'Sai-gon';
    } else if (widget.index == 5) {
      name = 'Vung-tau';
    } else if (widget.index == 6) {
      name = 'Quang-nam';
    } else if (widget.index == 7) {
      name = 'Hoi-an';
    } else if (widget.index == 8) {
      name = 'Da-nang';
    } else if (widget.index == 9) {
      name = 'Ha-noi';
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
                      //Ten thanh pho, thoi gian va Nhiet Do, Thoi Tiet
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Ten Thanh Pho
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
                          //Nhiet do va Kieu thoi tiet
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              //Nhiet do
                              Text(
                                weathersDisplay.temp_c.toString() + '\u2103',
                                style: GoogleFonts.beVietnam(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //Kieu thoi tiet
                              Row(
                                children: [
                                  Image.network(
                                    'https:' + weathersDisplay.icon,
                                    height: 26,
                                    width: 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    weathersDisplay.text,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Chi so khong khi
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //UV
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 50,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                    child: Image.network(
                                      'https://www.pnglib.com/wp-content/uploads/2020/01/uv-lamp_5e1c7d972b683.png',
                                      height: 40,
                                      width: 40,
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                  Text(
                                    weathersDisplay.uv.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 80, 0),
                                    child: Text(
                                      'lvl',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //CO2
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 50,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                    child: Image.network(
                                      'https://cdn-icons-png.flaticon.com/512/162/162408.png',
                                      height: 40,
                                      width: 40,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Text(
                                    weathersDisplay.co.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 60, 0),
                                    child: Text(
                                      'ppm',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //NO2
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 50,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                    child: Image.network(
                                      'https://devward.com/images/7.png',
                                      height: 40,
                                      width: 40,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                  Text(
                                    weathersDisplay.no2.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 63, 0),
                                    child: Text(
                                      'ppb',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Ozone
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 50,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(66, 0, 0, 0),
                                    child: Image.network(
                                      'https://iconape.com/wp-content/png_logo_vector/isologotipo-o3.png',
                                      height: 30,
                                      width: 30,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  Text(
                                    weathersDisplay.o3.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 60, 0),
                                    child: Text(
                                      'ppm',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //SO2
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 50,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(66, 0, 0, 0),
                                    child: Image.network(
                                      'http://giamsatmoitruong.iot47.com/so2.png',
                                      height: 40,
                                      width: 40,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                  Text(
                                    weathersDisplay.so2.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 31, 0),
                                    child: Text(
                                      'mrg/m3',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
