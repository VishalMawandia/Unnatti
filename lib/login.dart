import 'dart:ui';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


abstract class LoginPageModel extends State<LoginPage> {
}


class _LoginPageState extends LoginPageModel {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          // Background Blurred
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login_backgroud.jpg'),
                  fit: BoxFit.fill),
            ),
            child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
            ),
          ),

          // Login Components
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.zero,
                  height: _size.height * .4,
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraint) {
                      _size = Size(constraint.maxWidth, constraint.maxHeight);

                      return Center(
                        child: Image.asset(
                          'assets/flutter.png',
                          height: _size.height * .5,
                          width: _size.height * .5,
                        ),
                      );
                    },
                  ),
                ),

                // Login Text

                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                    ),
                    textScaleFactor: 3.5,
                  ),
                ),


                // InputFields

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _size.width * .12, vertical: 5.0),
                  child: new TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Email address",
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _size.width * .12, vertical: 5.0),
                  child: new TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Password",
                    ),
                  ),
                ),

                SizedBox(
                  height: 25.0,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _size.width * .12, vertical: 5.0),
                  child: InkWell(
                    onTap: () {
                    },
                    child: new Container(
                      padding: EdgeInsets.all(10.0),
                      width: _size.width * .6,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _size.width * .12, vertical: 5.0),
                  child: InkWell(
                    onTap: () {
                    },
                    child: new Container(
                      padding: EdgeInsets.all(10.0),
                      width: _size.width * .6,
                      height: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.0,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(child: Container(),),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Be Anonymous",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
