import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/network/getdata.dart';
import 'package:weather/network/weather.dart';

class SingleAQI extends StatefulWidget {
  final int index;
  SingleAQI(this.index);
  @override
  State<SingleAQI> createState() => _SingleAQIState();
}

class _SingleAQIState extends State<SingleAQI> {
  String name;
  Weather weathersDisplay = new Weather();
  GetData client = GetData();

  Future<void> getWeather() async {
    weathersDisplay = await client.getCurrentWeather(name);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.index == 0) {
      name = 'Ca-mau';
    } else if (widget.index == 1) {
      name = 'Calgary';
    } else if (widget.index == 2) {
      name = 'Havana';
    } else if (widget.index == 3) {
      name = 'Moscow';
    } else if (widget.index == 4) {
      name = 'Paris';
    } else if (widget.index == 5) {
      name = 'Seoul';
    } else if (widget.index == 6) {
      name = 'Sydney';
    } else if (widget.index == 7) {
      name = 'Shanghai';
    } else if (widget.index == 8) {
      name = 'Taiwan';
    } else if (widget.index == 9) {
      name = 'Tokyo';
    }

    return FutureBuilder<void>(
      future: getWeather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            margin: EdgeInsets.only(top: 60),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                //Ten Thanh pho, Ten nuoc, Thoi gian
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 96,),
                      //Ten thanh pho
                      Text(
                        formatTenTP(weathersDisplay.name),
                        style: GoogleFonts.robotoSlab(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        formatTenNuoc(weathersDisplay.country),
                        style: GoogleFonts.robotoSlab(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        weathersDisplay.localtime.toString(),
                        style: GoogleFonts.robotoSlab(
                          fontSize: 30,
                          color: Colors.white,
                          fontStyle: FontStyle.italic
                      )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                //Text Ch???t l?????ng kh??ng kh??
                Container(

                  height: 60,
                  width: 260,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(193,193,193, 0.3),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Air Quality',
                      style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                //3 Field Thuoc Tinh Ben Tren
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //CO
                      Container(
                        height: 150,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(36, 36, 36, 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/icon/co2.png', width: 45, height: 45,color: Colors.greenAccent,),
                            Text(weathersDisplay.co.toStringAsFixed(1), style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                            Text('ppm', style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                          ],
                        ),
                      ),
                      //PM2.5
                      Container(
                        height: 150,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(36, 36, 36, 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('PM2.5', style: GoogleFonts.robotoSlab(color: Colors.yellowAccent, fontSize: 21,fontWeight: FontWeight.bold),),
                            Text(weathersDisplay.pm2_5.toStringAsFixed(1), style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                            Text('??m/m3', style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                          ],
                        ),
                      ),
                      //O3
                      Container(
                        height: 150,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(36, 36, 36, 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/icon/o3.png', width: 35, height: 35,color: Colors.deepOrangeAccent,),
                            Text(weathersDisplay.o3.toStringAsFixed(1), style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                            Text('mg/m3', style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                //3 Field Thuoc Tinh Ben Duoi
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //S02
                      Container(
                        height: 150,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(36, 36, 36, 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/icon/so2.png', width: 45, height: 45,color: Colors.blueAccent,),
                            Text(weathersDisplay.so2.toStringAsFixed(1), style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                            Text('mg/m3', style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                          ],
                        ),
                      ),
                      //PM1.0
                      Container(
                        height: 150,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(36, 36, 36, 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('PM1.0', style: GoogleFonts.robotoSlab(color: Colors.purpleAccent, fontSize: 21,fontWeight: FontWeight.bold),),
                            Text(weathersDisplay.pm10.toStringAsFixed(1), style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                            Text('??m/m3', style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                          ],
                        ),
                      ),
                      //NO2
                      Container(
                        height: 150,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(36, 36, 36, 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/icon/no2.png', width: 45, height: 45,color: Colors.redAccent,),
                            Text(weathersDisplay.no2.toStringAsFixed(1), style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                            Text('ppm', style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/error.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ));
        }
        return CircularProgressIndicator.adaptive();
      },
    );
  }

  String formatTiengViet(String txt) {
    if (txt == 'Sunny') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Sunny', 'N???ng ?????p');
    } else if (txt == 'Partly cloudy') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Partly cloudy', 'Tr???i nhi???u m??y');
    } else if (txt == 'Patchy rain possible') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Patchy rain possible', 'C?? th??? m??a');
    } else if (txt == 'Light rain') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Light rain', 'M??a nh???');
    } else if (txt == 'Mist') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Mist', 'S????ng m?? nh???');
    } else if (txt == 'Fog') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Fog', 'C?? S????ng m??');
    } else if (txt == 'Light rain shower') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Light rain shower', 'M??a r??o nh???');
    } else if (txt == 'Clear') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Clear', 'Tr???i quang');
    } else if (txt == 'Overcast') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Overcast', 'Tr???i U ??m');
    } else if (txt == 'Moderate or heavy rain shower') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Moderate or heavy rain shower', 'M??a v???a ho???c m??a to');
    }
    return weathersDisplay.textcondition.toString();
  }

  String formatTenTP(String txt) {
    if (txt == 'Ca Mau') {
      return weathersDisplay.name.toString().replaceAll('Ca Mau', 'T???nh C?? Mau');
    } else if (txt == 'Shanghai') {
      return weathersDisplay.name
          .toString()
          .replaceAll('Shanghai', 'Th?????ng H???i');
    } else if (txt == 'Taiwan') {
      return weathersDisplay.name.toString().replaceAll('Taiwan', '????i Loan');
    }
    return weathersDisplay.name.toString();
  }

  String formatTenNuoc(String txt) {
    if (txt == 'Vietnam') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Vietnam', 'Vi???t Nam');
    } else if (txt == 'France') {
      return weathersDisplay.country.toString().replaceAll('France', 'Ph??p');
    } else if (txt == 'Russia') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Russia', 'Li??n Bang Nga');
    } else if (txt == 'South Korea') {
      return weathersDisplay.country
          .toString()
          .replaceAll('South Korea', 'H??n Qu???c');
    } else if (txt == 'Australia') {
      return weathersDisplay.country.toString().replaceAll('Australia', '??c');
    } else if (txt == 'China') {
      return weathersDisplay.country
          .toString()
          .replaceAll('China', 'Trung Qu???c');
    } else if (txt == 'Taiwan') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Taiwan', '????i Loan');
    } else if (txt == 'Japan') {
      return weathersDisplay.country.toString().replaceAll('Japan', 'Nh???t B???n');
    }
    return weathersDisplay.country.toString();
  }
}
