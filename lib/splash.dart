import 'package:flutter/material.dart';
import 'package:test123/HomePage.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() {
    return new SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images.jpeg'),
            fit: BoxFit.fitWidth
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 70.0),
            child: Text(
              "",
              maxLines: 3,
              style: TextStyle(
                color: Colors.white,
                fontSize: 70.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    navigateNextScreen();
  }

  void navigateNextScreen() async {
    await Future.delayed(Duration(seconds: 5));
    if (this.mounted)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
