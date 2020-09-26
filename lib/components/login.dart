import 'package:flutter/material.dart';
import 'package:mvmis/Animations/FadeAnimation.dart';
import 'package:mvmis/components/main_page.dart' as prefix0;
import 'package:mvmis/config/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 400.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Positioned(
                    left: 30.0,
                    width: 80.0,
                    height: 200.0,
                    child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-1.png'))),
                        ))),
                Positioned(
                    left: 140.0,
                    width: 80.0,
                    height: 150.0,
                    child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-2.png'))),
                        ))),
                Positioned(
                    right: 40.0,
                    top: 40.0,
                    width: 80.0,
                    height: 200.0,
                    child: FadeAnimation(
                        1.5,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/clock.png'))),
                        ))),
                Positioned(
                    child: FadeAnimation(
                        1.6,
                        Container(
                          margin: EdgeInsets.only(top: 50.0),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )))
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                        1.7,
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, 0.2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter Your Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter Your Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    SizedBox(height: 30.0),
                    FadeAnimation(
                        2,
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1.0),
                                Color.fromRGBO(143, 148, 251, 0.6),
                              ])),
                          child: InkWell(
                            onTap: () async {
                              dynamic result =
                                  await _auth.signInWithEmailAndPassword(
                                      email.trim(), password.trim());
                              if (result == null) {
                                print('Not Logged In');
                                print(result);
                              }
                              else{
                                print('Logged in');
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => prefix0.MainPage()));
                              }
                            },
                            child: Center(
                                child: Text("Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ),
                        )),
                    SizedBox(height: 30.0),
                    FadeAnimation(
                        2.5,
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1.0),
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
