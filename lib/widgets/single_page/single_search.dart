import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'single_weather.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name;
  String backgImg = 'assets/weather/camau.jpg';

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
    return Container(
      child: Stack(
        children: [
          Image.asset(
            backgImg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      // width: double.infinity,
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
                            hintText: '',
                            hintStyle: GoogleFonts.lato(fontSize: 18,),
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
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 100,
                      color: Colors.redAccent,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
