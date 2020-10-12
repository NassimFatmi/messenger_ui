import 'package:flutter/material.dart';
import 'package:messenger_ui/chatViewer.dart';

class Chat extends StatefulWidget {
  String destinationImagelink;
  String message;
  String hour;
  String destinatinUserName;
  bool seen;
  bool fromMe;

  Chat(
      {Key key,
      this.destinatinUserName,
      this.seen,
      this.destinationImagelink,
      this.hour,
      this.message,
      this.fromMe})
      : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String _message() {
    if (widget.fromMe) {
      return 'You : ${widget.message} . ${widget.hour}';
    } else {
      return '${widget.message} . ${widget.hour}';
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
              context, MaterialPageRoute(builder: (context) => ChatViewer()));
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        height: size.height * 0.12,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                //recever Image
                Container(
                  height: size.height * 0.09,
                  width: size.height * 0.09,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.destinationImagelink),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                //chat
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.destinatinUserName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: widget.seen
                              ? FontWeight.normal
                              : FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      _message(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: widget.seen
                              ? FontWeight.normal
                              : FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                height: 20.0,
                width: 20.0,
                child: widget.seen
                    ? Image(image: NetworkImage(widget.destinationImagelink))
                    : Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                        size: 18.0,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
