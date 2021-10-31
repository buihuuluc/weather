import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/models/weather_location.dart';

class SingleWeather extends StatelessWidget {

  final int index;
  SingleWeather(this.index);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(20,20,20,0),
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
                    SizedBox(height: 90,),
                    //Ten Thanh Pho
                    Text(locationList[index].city,style: GoogleFonts.lato(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    //Thoi gian
                    Text(locationList[index].dateTime,style: GoogleFonts.lato(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 15,),
                //3 ngay tiep theo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: const Color(0xcccccc).withOpacity(0.2),
                          borderRadius: BorderRadius.all(
                             Radius.circular(10)
                            )
                        ),
                        height: 230,
                        width: 120,
                        child: Column(
                          children: [
                            Text('Yesterday', style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),),
                          ],
                        )
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: const Color(0xcccccc).withOpacity(0.2),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            )
                        ),
                        height: 230,
                        width: 120,
                        child: Column(
                          children: [
                            Text('Today', style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),),
                          ],
                        )
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xcccccc).withOpacity(0.2),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      ),
                      height: 230,
                      width: 120,
                      child: Column(
                        children: [
                          Text('Tomorrow', style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),),
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
                    Text(locationList[index].temperature,style: GoogleFonts.lato(fontSize: 68, color: Colors.white, fontWeight: FontWeight.w500),),
                    //Daylight
                    Row(
                      children: [
                        SvgPicture.asset(locationList[index].iconUrl, height: 30, width: 34, color: Colors.white,),
                        SizedBox(width: 5),
                        Text(locationList[index].weatherType, style: GoogleFonts.lato(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),),
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
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white30),),
              ),
              //Wind, Rain, Humidity
              Column(
                children: [
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Wind', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white)),
                          Text(locationList[index].wind.toString(), style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text('km/h', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white)),
                          Stack(
                            children: [
                              Container(width: 60, height: 5,color: Colors.grey,),
                              Container(width: locationList[index].wind/2, height: 5,color: Colors.blueAccent,)
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text('Rain', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white)),
                          Text(locationList[index].rain.toString(), style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text('%', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white)),
                          Stack(
                            children: [
                              Container(width: 60, height: 5,color: Colors.grey,),
                              Container(width: locationList[index].rain/2, height: 5,color: Colors.redAccent,)
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text('Humdity', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white)),
                          Text(locationList[index].humidity.toString(), style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text('%', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white)),
                          Stack(
                            children: [
                              Container(width: 60, height: 5,color: Colors.grey,),
                              Container(width: locationList[index].humidity/2, height: 5,color: Colors.yellowAccent,)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5,)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
