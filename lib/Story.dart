import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  final int storyId;
  final String story;
  final Function callback;
  final List<String> comments;

  StoryPage(this.storyId, this.story, this.comments, this.callback);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  TextEditingController textEditingController;

  void initState() {
    super.initState();
    textEditingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 3.00,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Anonymous",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.story,
                                textScaleFactor: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 450.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(50.0, 10.0, 10.0, 30.0),
                        child: ListView.builder(
                          itemCount: widget.comments != null
                              ? widget.comments.length
                              : 0,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.comments[index],
                                  textScaleFactor: 1.2,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                            hintText: "Add Comment..",
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          if (textEditingController.text == "") return;
                          widget.callback(
                              textEditingController.text, widget.storyId);
                          textEditingController.clear();
                          setState(() {});
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
