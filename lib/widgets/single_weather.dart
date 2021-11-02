import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/models/weather_location.dart';
import 'package:weather/network_api/openjsondecode.dart';
import 'package:weather/network_api/openweathers.dart';
import 'package:intl/intl.dart';

class SingleWeather extends StatefulWidget {
  final int index;
  SingleWeather(this.index);
  @override
  State<SingleWeather> createState() => _SingleWeatherState();
}

class _SingleWeatherState extends State<SingleWeather> {
  String name;
  WeathersApi weathersDisplay = new WeathersApi();
  Api client = Api();
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
                            weathersDisplay.cityName.toString(),
                            style: GoogleFonts.lato(
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
                            locationList[widget.index].dateTime,
                            style: GoogleFonts.lato(
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
                                  color: const Color(0xcccccc).withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 230,
                              width: 120,
                              child: Column(
                                children: [
                                  Text(
                                    'Yesterday',
                                    style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xcccccc).withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 230,
                              width: 120,
                              child: Column(
                                children: [
                                  Text(
                                    'Today',
                                    style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xcccccc).withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 230,
                            width: 120,
                            child: Column(
                              children: [
                                Text(
                                  'Tomorrow',
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //Nhiet do, daylight
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Nhiet Do
                          Text(
                            weathersDisplay.temp.toString() + '\u2103',
                            style: GoogleFonts.lato(
                                fontSize: 68,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          //Daylight
                          Row(
                            children: [
                              SvgPicture.asset(
                                locationList[widget.index].iconUrl,
                                height: 30,
                                width: 34,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                weathersDisplay.feels_like.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
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
                                Text('Wind',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Text(weathersDisplay.wind.toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('km/h',
                                    style: GoogleFonts.lato(
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
                                      width: weathersDisplay.wind,
                                      height: 5,
                                      color: Colors.blueAccent,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('Degree',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Text(weathersDisplay.degree.toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('°',
                                    style: GoogleFonts.lato(
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
                                          locationList[widget.index].rain / 2,
                                      height: 5,
                                      color: Colors.redAccent,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('Humdity',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                Text(weathersDisplay.humidity.toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('%',
                                    style: GoogleFonts.lato(
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
                                          locationList[widget.index].humidity /
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
        return CircularProgressIndicator();
      },
    );
  }
}
