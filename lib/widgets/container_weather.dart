import 'package:flutter/material.dart';

Widget ContainerWeather(String ImageNetwork, String clock, String NO){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        width: 150,
        height:100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Colors.indigo,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.network(ImageNetwork, width: 45,),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(clock, style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
                  Text(NO, style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
                ],
              )
            ],
          ),
        )
    ),
  );
}