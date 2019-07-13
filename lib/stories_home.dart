import 'package:flutter/material.dart';
import 'package:test123/Story.dart';

class StoriesHome extends StatefulWidget {
  @override
  _StoriesHomeState createState() => _StoriesHomeState();
}

class CommentsHolder {
  static List<String> storiesHolder = [
    "As a librarian, I've been threatened with stalking for not giving my phone number to a patron. I've also been shown naked, sexually explicit photos; and propositioned by countless men, some of which were married and standing right next to their children. Some of my female colleagues have had male patrons waiting for them in the parking lot after work, and they've received explicit messages over social media.",
    "I worked as an office manager, and the only woman, for an industrial insulation company. I had just come back from maternity leave and I was worried about my milk supply. I went into the bathroom to pump for about 15 minutes every two hours, and all of the men in the office would stand in the break area (right in front of the bathroom door) and make baby crying noises to make fun of me. Eventually it progressed to the point that they would make crying noises every time they passed my desk in hopes that I would leak through my shirt.\nThey would also make comments about how much larger my breasts were since having a baby. I felt so harassed and unsafe that I would dread going to work every day, and I even had more than a few nervous breakdowns. My husband was furious and I had to convince him not to take any drastic action so that I could be sure to have a good reference if I needed to find another job. We had a long conversation and looked at our finances and decided the extra money wasn't worth the emotional distress. I ended up quitting my job and staying home with our kids.",
    "I used to work for a call center and the men there were extremely disgusting, always muttering sexual comments. The worst one I had was from a co-worker who used to message me on the work chat room, asking me to come blow him under his desk. When I reported it to HR they said I was the one causing the issue",
    "I work in law enforcement. I started out as a correctional officer in an all-male prison. When I was walking to my post one day an inmate screamed at me, 'Bitch, I'll beat your pussy so hard it'll put you in the hospital.' I called a unit code because to me, that is harassment. Violent sexual harassment. But because I worked in a male prison, I was supposed to let it go in one ear and out the other."
  ];
  static Map<int, List<String>> commentsHolder = Map();
}

class _StoriesHomeState extends State<StoriesHome> {
  List<String> stories;
  Map<int, List<String>> comments;

  @override
  void initState() {
    super.initState();

    this.comments = CommentsHolder.commentsHolder;

    this.stories = CommentsHolder.storiesHolder;
  }

  void addComment(String comment, int index) {
    if (comments[index] == null) comments[index] = List();
    comments[index].add(comment);
    CommentsHolder.commentsHolder = this.comments;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.stories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              color: Colors.blue[200],
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
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
                        stories[index],
                        textScaleFactor: 1.3,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.grey[200],
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new StoryPage(
                                        index,
                                        stories[index],
                                        comments[index] ?? [],
                                        addComment)));
                          },
                          child: Text(
                            "View/Add comments",
                            textScaleFactor: 1.1,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
