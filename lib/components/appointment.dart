import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFBC044),Color(0xFFD8992B)
                ]
              )
            ),
            padding: EdgeInsets.only(left: 15.0,right: 15.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 35.0,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(icon: Icon(Icons.close), onPressed: (){}),
                ),
                Text(
                  'Book an appointment',
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.white,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: 15.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    hintStyle: TextStyle(
                      color: Colors.white
                    ),prefixIcon: Icon(Icons.arrow_forward,color: Colors.white),
                    border: InputBorder.none
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'To Book an Appointment, Please leave us your phone number, our customer service should contact you within 12hours',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.normal
                      )
                  ),
                ),
                SizedBox(height: 40.0),
                Image.asset('assets/porsche.png',fit: BoxFit.cover,height: 200.0),
                Container(
                  height: 0.5,
                  color: Colors.white,
                ),
                SizedBox(height: 10.0),
                Text(
                    'Feline motors, We are your choice of speed.',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: 'Hind',
                        fontWeight: FontWeight.normal
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
