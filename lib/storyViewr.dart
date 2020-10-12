import 'package:flutter/material.dart';

class StoryViewr extends StatefulWidget {
  String imageLink;

  StoryViewr({
    this.imageLink,
  });
  @override
  _StoryViewrState createState() => _StoryViewrState();
}

class _StoryViewrState extends State<StoryViewr> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 20.0,
              left: 0.0,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Image(
              image: NetworkImage(widget.imageLink),
              height: size.height * 0.7,
              width: size.width,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: size.width * 0.55,
                      height: size.height * 0.065,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white.withOpacity(0.4)),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Colors.white,
                        autofocus: false,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            hintText: 'Comment...',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300)),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 25.0,
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            onPressed: null),
                        IconButton(
                            icon: Icon(
                              Icons.thumb_down,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            onPressed: null),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
