import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/network_api/getdata.dart';
import 'package:weather/network_api/weather.dart';

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
      name = 'Darwin';
    } else if (widget.index == 2) {
      name = 'Seoul';
    } else if (widget.index == 3) {
      name = 'Taiwan';
    } else if (widget.index == 4) {
      name = 'Havana';
    } else if (widget.index == 5) {
      name = 'Calgary';
    } else if (widget.index == 6) {
      name = 'Mandalay';
    } else if (widget.index == 7) {
      name = 'Paris';
    } else if (widget.index == 8) {
      name = 'Moscow';
    } else if (widget.index == 9) {
      name = 'Dubai';
    }

    return FutureBuilder<void>(
      future: getWeather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                weathersDisplay.country.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
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
                                weathersDisplay.temp.toString() + '\u2103',
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
                                  Text(
                                    weathersDisplay.localtime.toString(),
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //3 Row show info
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //Cloud
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Type',
                                        style: GoogleFonts.lato(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 180,
                                        child: Text(
                                          weathersDisplay.textcondition
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.satisfy(
                                              fontSize: 20,
                                              color: Colors.white54),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Cloud',
                                        style: GoogleFonts.satisfy(
                                          fontSize: 28,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        weathersDisplay.cloud.toString(),
                                        style: GoogleFonts.satisfy(
                                          fontSize: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Image.network(
                                          'https:' +
                                              weathersDisplay.iconcondition
                                                  .toString(),
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ),
                            //UV
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 70,
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
                                        const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Ultra Violet',
                                            style: GoogleFonts.satisfy(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    weathersDisplay.uv.toString(),
                                    style: GoogleFonts.satisfy(
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 40, 0),
                                    child: Image.asset(
                                      'assets/icon/uv.png',
                                      height: 64,
                                      width: 64,
                                      color: Colors.yellowAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Feel like
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 70,
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
                                        const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                    child: Container(
                                      child: Text(
                                        'Feels like',
                                        style: GoogleFonts.satisfy(
                                            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    weathersDisplay.feellike.toString() +
                                        '\u2103',
                                    style: GoogleFonts.satisfy(
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 40, 0),
                                    child: Image.asset(
                                      'assets/icon/feelslike.png',
                                      height: 46,
                                      width: 46,
                                      color: Colors.greenAccent,
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
                                Text('Wind',
                                    style: GoogleFonts.beVietnam(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Text(weathersDisplay.windkph.toString(),
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
                                      width: weathersDisplay.windkph.toDouble(),
                                      height: 5,
                                      color: Colors.blueAccent,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('W-Degree',
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
                                              .toDouble() %
                                          60,
                                      height: 5,
                                      color: Colors.redAccent,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('Humidity',
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
