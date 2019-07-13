import 'package:flutter/material.dart';
import 'package:test123/stories_home.dart';

class AddStory extends StatefulWidget {
  @override
  _AddStoryState createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your story"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(hintText: "Share your story"),
                controller: textEditingController,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () {
                if (textEditingController.text == "") return;

                CommentsHolder.storiesHolder.add(textEditingController.text);
                Navigator.pop(context);
              },
              child: Text("Post your story"),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.textEditingController = new TextEditingController();
  }
}
