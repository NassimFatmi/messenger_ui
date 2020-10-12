import 'package:flutter/material.dart';

class ChatViewer extends StatefulWidget {
  @override
  _ChatViewerState createState() => _ChatViewerState();
}

class _ChatViewerState extends State<ChatViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: TweenAnimationBuilder(
        child: Icon(
          Icons.favorite,
          color: Colors.red,
          size: 100.0,
        ),
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: 2),
        builder: (BuildContext context, double _val, Widget child) {
          return Opacity(
            opacity: _val,
            child: Padding(
              padding: EdgeInsets.only(top: _val * 200),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
