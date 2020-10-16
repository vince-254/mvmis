import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvmis/config/auth.dart';
import 'package:mvmis/screens/dashboard.dart';

class Admin extends StatefulWidget {
  Admin({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  String _email;
  String _password;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;

  void _showNotification() async {
    await _demoNotification();
  }

  Future<void> _demoNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'test ticker');

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, 'Hello, ', 'A new user has been created', platformChannelSpecifics,
        payload: 'test oayload');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('Notification payload: $payload');
    }
    await Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new Dashboard()));
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(body),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Ok'),
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                            // _showNotification();
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => MyHomePage()));
                            if (_email != null && _password != null) {
                              AuthService()
                                  .registerWithEmailAndPassword(
                                  _email, _password)
                                  .then((e) {
                                if (e != null) {
                                  _showNotification();
                                }
                              });

                            }

                                // whenComplete(() => _showNotification())
                                ;

                            // dbRef.get().then((data) {
                            //   data.exists ? _goToHomeScreen(user) :
                            //   _createUser();
                            // });

                            // FirebaseAuth.instance
                            //         .createUserWithEmailAndPassword(
                            //             email: _email, password: _password)
                            //     .then((signedInUser) {
                            //   UserManagement().storeNewUser(signedInUser, context);
                            // })
                            // ;
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
            ),
          )
        ],
      ),
    );
  }
}

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AlertPage'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text('go Back ...'),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
