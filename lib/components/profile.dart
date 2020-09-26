import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mvmis/components/appointment.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String title = '';
  String helper = '';
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState(){
    super.initState();
    _firebaseMessaging.configure(
        onMessage: (message) async{
          setState(() {
            title  = message['notification']['title'];
            helper = "New notification from Feline Motors";
          });
        },
        onResume: (message) async {
          setState(() {
            title  = message['data']['title'];
            helper = "New notification from Feline Motors";
          });
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 15.0),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: Icon(
                Icons.spa,
                color: Colors.amber,
                size: 35.0,
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Color(0xe20000).withOpacity(0.7),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    letterSpacing: 0.05),
              ),
            ),
            SizedBox(height: 20.0),
            Image.asset(
              'assets/porsche.png',
              fit: BoxFit.cover,
              height: 175.0,
              width: MediaQuery.of(context).size.width - 30,
            ),
            Text(
              'PORSCHE',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '2019  - 911 CARRER  S',
              style: TextStyle(
                  color: Color(0xFF434C68).withOpacity(0.7),
                  fontFamily: 'Montserrat',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 0.75,
              width: MediaQuery.of(context).size.width - 30.0,
              color: Color(0xFF434C68).withOpacity(0.7),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.local_gas_station,
                          color: Color(0xFF434C68).withOpacity(0.7),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '19/24',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.network_check,
                          color: Color(0xFF434C68).withOpacity(0.7),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '3.2',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.build,
                          color: Color(0xFF434C68).withOpacity(0.7),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '443',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 20.0),
            Container(
              height: 0.75,
              width: MediaQuery.of(context).size.width - 30.0,
              color: Color(0xFF434C68).withOpacity(0.7),
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Appointment())),
              child: Row(
                children: <Widget>[
                  Icon(Icons.assignment,
                      size: 45.0,
                      color: Color(0xFF434C68).withOpacity(0.7)),
                  SizedBox(width: 10.0),
                  Text(
                    'BOOK AN APPOINTMENT',
                    style: TextStyle(
                        color: Color(0xFF434C68).withOpacity(0.7),
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 30.0, color: Color(0xFF434C68).withOpacity(0.7))
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}