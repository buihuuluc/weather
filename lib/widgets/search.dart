import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name;
  void _onTextFieldSubmitted(String input) {

    setState(() {
      name = input;
    });
    print(name);
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          children: [
            Image.network(
              'https://r1.ilikewallpaper.net/iphone-xs-max-wallpapers/download/35501/Storm-Lightning-Over-Lake-Night-Sky-View-iphone-xs-max-wallpaper-ilikewallpaper_com.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white70,
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
                          hintStyle: GoogleFonts.robotoSlab(fontSize: 18,),
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.search),
                          ),
                        ),
                        onSubmitted: (String input) {
                          _onTextFieldSubmitted(input);
                        },
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height:20),
                      Text(
                          'Cà Mau',
                          style: GoogleFonts.robotoSlab(
                            fontSize: 50,
                            fontWeight:FontWeight.w400,
                            color: Colors.white,
                          )),
                      SizedBox(height:10),
                      Text(
                          'Thứ 5, 5/11/2021 - 10:00 - PM',
                          style: GoogleFonts.robotoSlab(
                            fontSize: 20,
                            fontWeight:FontWeight.w400,
                            color: Colors.white,
                          )),
                      SizedBox(height:10),
                      Text(
                          '26 \u2103',
                          style: GoogleFonts.robotoSlab(
                            fontSize: 100,
                            fontWeight:FontWeight.w400,
                            color: Colors.white,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Weather-storm.svg/1200px-Weather-storm.svg.png', width: 100,),
                          SizedBox(width:20),
                          Text('Vùng tâm bão',
                              style: GoogleFonts.robotoSlab(
                                fontSize: 32,
                                fontWeight:FontWeight.w400,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      SizedBox(height:20),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white38,
                          ),
                          child: Center(child: Text('Dự Báo 7 ngày',style: GoogleFonts.robotoSlab(color: Colors.white,fontSize: 20),))),
                      SizedBox(height:15),
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: 150,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius:  BorderRadius.circular(30),
                                  color: Colors.white38,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text('Thứ ${index+2}', style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red,
                                      )),
                                    ),
                                    SizedBox(height:10),
                                    Image.network('https://icon-library.com/images/rainy-icon/rainy-icon-1.jpg', height: 55,),
                                    SizedBox(width: 2,),
                                    Text('Mưa lâm râm',
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueAccent,
                                      ),),
                                    SizedBox(height: 2,),
                                    Text('Nhiệt Độ Trung Bình', style: GoogleFonts.robotoSlab(fontSize: 15, color: Colors.orange)),
                                    Text(' 30 \u2103',
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ))

                                  ],
                                ),
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
