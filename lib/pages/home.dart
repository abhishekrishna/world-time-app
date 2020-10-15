import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;


    //set background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blueAccent : Colors.deepPurple;
    Color textColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
                  icon: Icon(
                      Icons.edit_location,
                  color: textColor,), label: Text('Edit Location',
                  style: TextStyle(
                    color: textColor,
                  ),)),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text(data['location'],
                style: TextStyle(
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                  color: textColor,
                ) ,)
              ]),
              SizedBox(height: 20.0),
              Text(

                data ['time'],
                style: TextStyle(fontSize: 55.0,
                color: textColor),

              )
            ],
          ),
        ),
      )
      ),
    );
  }
}
