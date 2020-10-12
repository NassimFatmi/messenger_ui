import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:messenger_ui/chat.dart';
import 'package:messenger_ui/story.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Roboto'),
    home: Messenger(),
  ));
}

class Messenger extends StatefulWidget {
  Messenger({
    Key key,
  }) : super(key: key);

  @override
  _MessengerState createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  int _selectedIndex = 0;

  _tabSelectionChanged(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _tabSelectionChanged(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble,
              size: 30.0,
            ),
            title: Text('Chats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30.0,
            ),
            title: Text('People'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('http://unsplash.it/50/50'),
                        radius: 20.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Chats',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Ink(
                        decoration: ShapeDecoration(
                          color: Colors.grey[900],
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          iconSize: 22.0,
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Ink(
                        decoration: ShapeDecoration(
                          color: Colors.grey[900],
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          iconSize: 22.0,
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: size.width * 0.95,
                  height: size.height * 0.065,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.grey[400].withOpacity(0.4)),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.white,
                    autofocus: false,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        hintText: 'Search',
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey[500],
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
                width: size.width,
                height: size.height * 0.13,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    //add Story
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      height: size.height * 0.1,
                      width: size.height * 0.1,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Container(
                            height: size.height * 0.09,
                            width: size.height * 0.09,
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.grey[900],
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 35.0,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Positioned(
                            bottom: 00,
                            child: Text(
                              'Your story',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //People stories
                    Story(
                      imageLink: 'http://unsplash.it/100/100',
                      userName: 'Nassim',
                      seen: false,
                    ),
                    Story(
                      imageLink: 'http://unsplash.it/100/150',
                      userName: 'Chlfi',
                      seen: false,
                    ),
                    Story(
                      imageLink: 'http://unsplash.it/110/160',
                      userName: 'yaloui',
                      seen: true,
                    ),
                    Story(
                      imageLink: 'http://unsplash.it/120/160',
                      userName: 'basset02',
                      seen: true,
                    ),
                  ],
                )),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Chat(
                      destinatinUserName: 'Nassim Fatmi',
                      destinationImagelink: 'http://unsplash.it/150/150',
                      fromMe: true,
                      hour: '23:00',
                      message: 'Slm cv',
                      seen: true,
                    ),
                    Chat(
                      destinatinUserName: 'Chlfi BSSOUTI',
                      destinationImagelink: 'http://unsplash.it/140/140',
                      fromMe: false,
                      hour: '23:32',
                      message: 'hwini ana mch yaloui',
                      seen: true,
                    ),
                    Chat(
                      destinatinUserName: 'Yaloui AKLI',
                      destinationImagelink: 'http://unsplash.it/160/160',
                      fromMe: false,
                      hour: '23:31',
                      message: 'Thwini ?',
                      seen: false,
                    ),
                    Chat(
                      destinatinUserName: 'Nassim FA',
                      destinationImagelink: 'http://unsplash.it/120/120',
                      fromMe: true,
                      hour: '23:20',
                      message: 'Ani nhwi f yaloui',
                      seen: true,
                    ),
                    Chat(
                      destinatinUserName: 'Djammel akli',
                      destinationImagelink: 'http://unsplash.it/140/120',
                      fromMe: false,
                      hour: '23:19',
                      message: 'Slm',
                      seen: true,
                    ),
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
