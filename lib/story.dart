import 'package:flutter/material.dart';
import 'package:messenger_ui/storyViewr.dart';

class Story extends StatefulWidget {
  Story({
    this.imageLink,
    this.userName,
    this.seen,
    Key key,
  }) : super(key: key);

  String imageLink;
  String userName;
  bool seen;

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  Widget creatStoryImage(size) {
    if (!widget.seen) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: size.height * 0.1,
            width: size.height * 0.1,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.blueAccent[400],
            ),
          ),
          Container(
            height: size.height * 0.087,
            width: size.height * 0.087,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.black,
            ),
          ),
          Container(
            height: size.height * 0.08,
            width: size.height * 0.08,
            decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(widget.imageLink), fit: BoxFit.fill)),
          ),
        ],
      );
    } else {
      return Container(
        height: size.height * 0.1,
        width: size.height * 0.1,
        decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.blue,
            image: DecorationImage(
                image: NetworkImage(widget.imageLink), fit: BoxFit.fill)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.seen = true;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      StoryViewr(imageLink: widget.imageLink)));
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        width: size.height * 0.11,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            creatStoryImage(size),
            Positioned(
              bottom: 00,
              child: Text(
                widget.userName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
