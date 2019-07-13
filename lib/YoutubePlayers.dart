import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:test123/VideoWidget.dart';

class YoutubePlayers extends StatefulWidget {
  @override
  _YoutubePlayersState createState() => _YoutubePlayersState();
}

abstract class YoutubePlayersModel extends State<YoutubePlayers> {
  final List<String> video_ids = ["T7aNSRoDCmg", "-V4vEyhWDZ0", "9m-x64bKfR4","4kyGetyhNeo","H5owCNvik0E","L5EPUjHiKzs"];
  final List<String> video_titles = [
    "7 Self-Defense Techniques for Women from Professionals",
    "5 Choke Hold Defenses Women MUST Know | Self Defense | Aja Dang",
    "Self Defence Techniques for girls by Delhi Police Part 1",
    "Sexual Harassment at the Workplace",
    "#ThatsHarassment | The Boss ft. Zazie Beetz & David Schwimmer",
    "#ThatsHarassment | The Doctor ft. Cynthia Nixon & Michael Kelly"
  ];
  final List<String> video_duration = ["8:24", "9:44", "19:56","2:24","4:44","4:26"];

  void launchYoutube(String videoID) {
    AndroidIntent(
            action: "action_view",
            data: "http://www.youtube.com/watch?v=" + videoID)
        .launch();
  }
}

class _YoutubePlayersState extends YoutubePlayersModel {
  List<Widget> getVideoWidgets() {
    List<Widget> widgets = [];

    for (int i = 0; i < this.video_ids.length; i++) {
      widgets
          .add(VideoWidget(video_titles[i], video_ids[i], video_duration[i]));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/WOMEN-EMPOWERMENT.jpg'),fit: BoxFit.fill)
          ),
        ),

        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: getVideoWidgets(),
            ),
          ),
        ),
      ],
    );
  }
}
