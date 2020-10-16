import 'package:flutter/material.dart';

import 'admin.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Color.fromRGBO(34, 34, 34, 1)],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height / 3.0,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/car_logo.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: height / 40,
            ),
            Text(
              "Your dashboard",
              style: TextStyle(color: Colors.white, fontSize: height / 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height / 50,
            ),
            Text(
              "Servicing summary",
              style: TextStyle(
                  color: Color.fromRGBO(146, 146, 146, 1),
                  fontSize: height / 50),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 100, height: 100, child: Text("Last service")),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 100, height: 100, child: Text("Next service")),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Admin()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Container(width: 100, height: 50, child: Center(child: Text("Admin"))),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
