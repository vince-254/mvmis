import 'package:flutter/material.dart';
import 'package:mvmis/config/auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  String _email;
  String _password;
  var initializationSettingsAndroid;
  var initializationSettings;

  void _showNotification() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
              top: 30,
              left: 30,
              child: Container(
                child: Text(
                  "Create a New User",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
              left: 30,
              top: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Column(children: [
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter Email Adress",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Montserrat",
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        obscureText: true,
                        validator: (val) {
                          if (val.length == 0) {
                            return "Field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          fontFamily: "Montserrat",
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.lightGreenAccent,
                          color: Colors.blueGrey,
                          elevation: 10.0,
                          child: InkWell(
                            splashColor: Colors.lightGreenAccent,
                            onTap: () {
                              AuthService().registerWithEmailAndPassword(
                                _email, _password
                              )
                              // FirebaseAuth.instance
                              //         .createUserWithEmailAndPassword(
                              //             email: _email, password: _password)
                                  //     .then((signedInUser) {
                                  //   UserManagement().storeNewUser(signedInUser, context);
                                  // })
                                  ;
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Text("Sign up",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Montserrat",
                                              fontSize: 25.0)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
