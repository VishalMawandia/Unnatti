import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test123/AddStory.dart';
import 'package:test123/Constants.dart';
import 'package:test123/MyAudioRecorder.dart';
import 'package:test123/YoutubePlayers.dart';
import 'package:test123/stories_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

abstract class HomePageModel extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> _children = [
    YoutubePlayers(),
    StoriesHome(),
  ];

  void onTabTapped(int i) {
    setState(() {
      _currentPage = i;
    });
  }

  void activateDistressSignal() async {
    Position _position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    RecordAudio.recordAudio();

    print(
        "Current Co-ordinates is ${_position.latitude},${_position.longitude}");

    return;
  }
}

class _HomePageState extends HomePageModel {
  BuildContext _context;

  void showSnackBar(String text) {
    Scaffold.of(_context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[300],
        title: Text(Constants.appName),
        actions: <Widget>[
          FlatButton(
            color: Colors.red,
            onPressed: activateDistressSignal,
            child: Text(
              "Distress call",
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
          )
        ],
      ),
      floatingActionButton: _currentPage == 0
          ? null
          : new FloatingActionButton(
              onPressed: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddStory()));

              },
              child: Icon(Icons.add),
              isExtended: true,
              tooltip: "Add Story",
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: this.onTabTapped,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text("Videos"),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text("Stories"),
          ),
        ],
      ),
      body: _children[_currentPage],
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AndroidIntent(
                action: "action_view",
                data: "http://www.youtube.com/watch?v=" + "HpX1mDEw1gk")
            .launch();
      },
      child: Container(
        color: color,
      ),
    );
  }
}
