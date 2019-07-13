import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {


  final String title,image,duration;

  VideoWidget(this.title,this.image,this.duration);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){AndroidIntent(action: "action_view",data: "http://www.youtube.com/watch?v="+image).launch();},

      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
        ),
        margin: EdgeInsets.all(4.0),
        child: Row(
          children: <Widget>[

            Container(
              margin: EdgeInsets.all(8.0),
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .3),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    "https://img.youtube.com/vi/$image/0.jpg"
                  ),
                ],
              ),
            ),

            Expanded(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23.0,color: Colors.white),),
                  Text("Duration : $duration",style: TextStyle(fontSize: 21.5,color: Colors.white),),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}
