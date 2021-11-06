import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/network/getdata.dart';
import 'package:weather/network/weather.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String bg = 'assets/search/searchbg.jpg';
  String name = 'London';

  _onTextFieldSubmitted(String input) {
    setState(() {
      name = input;
    });
    print(name);
  }

  Weather weathersDisplay = new Weather();
  GetData client = GetData();

  Future<void> getWeather() async {
    weathersDisplay = await client.getCurrentWeather(name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onTextFieldSubmitted(name);
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            child: Stack(
              children: [
                //Background
                Image.asset(
                  bg,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                //Thanh tim kiem
                Container(
                  margin: EdgeInsets.only(top: 130, left: 10, right: 10),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 38, 38, 0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: GoogleFonts.robotoSlab(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nhập thành phố tìm kiếm ...',
                        hintStyle: GoogleFonts.robotoSlab(
                            fontSize: 18, color: Colors.white),
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onSubmitted: (String nhap) {
                        _onTextFieldSubmitted(nhap);
                      },
                    ),
                  ),
                ),
                //Noi dung
                Container(
                  margin: EdgeInsets.only(top: 116),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  //Hien thi Ten thanh pho, Thoi gian, Nhiet do, Daylight, Day phan cach, Rain, Wind...
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      //Ten thanh pho, thoi gian, nhiet do, Thoitiet
                      Container(
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
                                      height: 80,
                                    ),
                                    //Ten Thanh Pho
                                    Text(
                                      formatTenTP(weathersDisplay.name),
                                      style: GoogleFonts.beVietnam(
                                          fontSize: 34,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    //Thoi gian
                                    Text(
                                      formatTenNuoc(weathersDisplay.country),
                                      style: GoogleFonts.roboto(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                //Nhiet do va Kieu thoi tiet
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    //Nhiet do
                                    Text(
                                      weathersDisplay.temp.toString() +
                                          '\u2103',
                                      style: GoogleFonts.beVietnam(
                                          fontSize: 34,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
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
                              height: 40,
                            ),
                            //3 Row show info
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //Kiểu thời tiết và Cloud
                                  Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      height: 200,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Kiểu thời tiết',
                                                style: GoogleFonts.lato(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                width: 220,
                                                child: Text(
                                                  formatTiengViet(
                                                      weathersDisplay
                                                          .textcondition),
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.satisfy(
                                                      fontSize: 24,
                                                      color: Colors.white54,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                          // SizedBox(height: 5,),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Cloud',
                                                style: GoogleFonts.satisfy(
                                                  fontSize: 28,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                weathersDisplay.cloud
                                                    .toString(),
                                                style: GoogleFonts.satisfy(
                                                  fontSize: 40,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 14),
                                                child: Image.network(
                                                  'https:' +
                                                      weathersDisplay
                                                          .iconcondition
                                                          .toString(),
                                                  height: 80,
                                                  width: 80,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  //UV
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    height: 50,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 0, 0, 0),
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
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 40, 0),
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
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    height: 60,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 0, 0, 0),
                                          child: Container(
                                            child: Text(
                                              'Feels like',
                                              style: GoogleFonts.satisfy(
                                                  fontSize: 24,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 40, 0),
                                          child: Image.asset(
                                            'assets/icon/feelslike.png',
                                            height: 46,
                                            width: 46,
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
                      //Day phan cach va Wind, W-Degree, Dum
                      Column(
                        children: [
                          //Lan phan cach
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white54),
                            ),
                          ),
                          //Wind, W-Degree, Humidity
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Wind
                                  Column(
                                    children: [
                                      Text('Wind',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 18,
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
                                  //W-Degree
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('W-Degree',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white)),
                                      Text(weathersDisplay.winddegree.toString() + '°',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 20,),
                                      Stack(
                                        children: [
                                          Container(width: 60,height: 5,color: Colors.transparent,)
                                        ],
                                      )

                                    ],
                                  ),
                                  //Humidity
                                  Column(
                                    children: [
                                      Text('Humidity',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 18,
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
                              //Khoang cach voi bottom
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else
          return CircularProgressIndicator.adaptive();
      },
    );
  }

  String formatTiengViet(String txt) {
    if (txt == 'Sunny') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Sunny', 'Nắng đẹp');
    } else if (txt == 'Partly cloudy') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Partly cloudy', 'Trời nhiều mây');
    } else if (txt == 'Patchy rain possible') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Patchy rain possible', 'Có thể mưa');
    } else if (txt == 'Light rain') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Light rain', 'Mưa nhẹ');
    } else if (txt == 'Mist') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Mist', 'Sương mù nhẹ');
    } else if (txt == 'Fog') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Fog', 'Có Sương mù');
    } else if (txt == 'Light rain shower') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Light rain shower', 'Mưa rào nhẹ');
    } else if (txt == 'Clear') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Clear', 'Trời quang');
    } else if (txt == 'Overcast') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Overcast', 'Trời U ám');
    } else if (txt == 'Moderate or heavy rain shower') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Moderate or heavy rain shower', 'Mưa vừa hoặc mưa to');
    }
    return weathersDisplay.textcondition.toString();
  }

  String formatTenTP(String txt) {
    if (txt == 'Ca mau') {
      return weathersDisplay.name.toString().replaceAll('Ca mau', 'Cà Mau');
    } else if (txt == 'Shanghai') {
      return weathersDisplay.name
          .toString()
          .replaceAll('Shanghai', 'Thượng Hải');
    } else if (txt == 'Taiwan') {
      return weathersDisplay.name.toString().replaceAll('Taiwan', 'Đài Loan');
    } else if (txt == 'Pyongyang') {
      return weathersDisplay.name.toString().replaceAll('Pyongyang', 'Bình Nhưỡng');
    } else if (txt == 'Chengdu') {
      return weathersDisplay.name.toString().replaceAll('Chengdu', 'Thành Đô');
    } else if (txt == 'Da Nang') {
      return weathersDisplay.name.toString().replaceAll('Da Nang', 'Đà Nẵng');
    } else if (txt == 'Da Lat') {
      return weathersDisplay.name.toString().replaceAll('Da Lat', 'Đà Lạt');
    } else if (txt == 'Ha Noi') {
      return weathersDisplay.name.toString().replaceAll('Ha Noi', 'Hà Nội');
    } else if (txt == 'Vung Tau') {
      return weathersDisplay.name.toString().replaceAll('Vung Tau', 'Vũng Tàu');
    } else if (txt == 'Ap Binh Thuan') {
      return weathersDisplay.name.toString().replaceAll('Ap Binh Thuan', 'Bình Thuận');
    } else if (txt == 'Can Tho') {
      return weathersDisplay.name.toString().replaceAll('Can Tho', 'Cần Thơ');
    } else if (txt == 'Bac Lieu') {
      return weathersDisplay.name.toString().replaceAll('Bac Lieu', 'Bạc Liêu');
    } else if (txt == 'Soc Trang') {
      return weathersDisplay.name.toString().replaceAll('Soc Trang', 'Sóc Trăng');
    } else if (txt == 'Ho Chi Minh City') {
      return weathersDisplay.name.toString().replaceAll('Ho Chi Minh City', 'TP.Hồ Chí Minh');
    } else if (txt == 'Sai Gon') {
      return weathersDisplay.name.toString().replaceAll('Sai Gon', 'TP.Hồ Chí Minh');
    }
    return weathersDisplay.name.toString();
  }

  String formatTenNuoc(String txt) {
    if (txt == 'Vietnam') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Vietnam', 'Việt Nam');
    } else if (txt == 'France') {
      return weathersDisplay.country.toString().replaceAll('France', 'Pháp');
    } else if (txt == 'Russia') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Russia', 'Liên Bang Nga');
    } else if (txt == 'South Korea') {
      return weathersDisplay.country
          .toString()
          .replaceAll('South Korea', 'Hàn Quốc');
    } else if (txt == 'Australia') {
      return weathersDisplay.country.toString().replaceAll('Australia', 'Úc');
    } else if (txt == 'China') {
      return weathersDisplay.country
          .toString()
          .replaceAll('China', 'Trung Quốc');
    } else if (txt == 'Taiwan') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Taiwan', 'Đài Loan');
    } else if (txt == 'Japan') {
      return weathersDisplay.country.toString().replaceAll('Japan', 'Nhật Bản');
    } else if (txt == 'United States of America') {
      return weathersDisplay.country
          .toString()
          .replaceAll('United States of America', 'Mỹ Đế');
    } else if (txt == 'North Korea') {
      return weathersDisplay.country
          .toString()
          .replaceAll('North Korea', 'Bắc Triều Tiên');
    }
    return weathersDisplay.country.toString();
  }
  String doiten(String txt){
    return txt.toString().replaceAll(" ", "").toLowerCase();
  }
}