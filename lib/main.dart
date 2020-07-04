import 'dart:ui';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/Person.dart';

Color kPrimaryColor = Color(0xFF075E55);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatelessWidget {
  const WhatsAppHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp by CodeMinute"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[
          Stories(),
          Expanded(
            child: ChatList(),
          )
        ],
      ),
      bottomNavigationBar:
          BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBorderColor: Colors.white,
        selectedItemBackgroundColor: kPrimaryColor,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.black
      ),
      onSelectTab: (index) {
        setState(() {
          selectedIndex = index;
        });
      }, selectedIndex: selectedIndex, items: [
        FFNavigationBarItem(
          iconData: Icons.person,
          label: 'Chats'
        ),
        FFNavigationBarItem(
          iconData: Icons.people,
          label: 'Groups'
        ),
        FFNavigationBarItem(
          iconData: Icons.phone,
          label: 'Calls'
        ),
        FFNavigationBarItem(
          iconData: Icons.star,
          label: 'Favorites'
        ),
        FFNavigationBarItem(
          iconData: Icons.settings,
          label: 'Settings'
        )
      ]);
  }
}

class ChatList extends StatelessWidget {
  ChatList({List<Person> people});
  final List<Person> people = Person.getPeople();

  _buildChat({Person person}) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          child: ListTile(
            leading: ClipOval(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(person.imgUrl), fit: BoxFit.fill)),
              ),
            ),
            title: Text(
              "${person.firstname} ${person.lastname}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              person.lastMsg,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(person.time),
                if (person.firstname == 'Plisi')
                  ClipOval(
                    child: Container(
                      width: 21,
                      height: 21,
                      color: kPrimaryColor,
                      child: Center(
                          child: Text(
                        "2",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      color: Colors.grey[100],
      child: ListView(
        children: <Widget>[...people.map((e) => _buildChat(person: e))],
      ),
    );
  }
}

class Stories extends StatelessWidget {
  Stories({List<Person> people});
  final List<Person> people = Person.getPeople();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 90,
        margin: EdgeInsets.only(top: 12),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            OwnStory(),
            ...people.map((e) => Story(person: e))
          ],
        ),
      ),
    );
  }
}

class OwnStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Colors.green[200], Colors.green[600]],
                    ),
                  ),
                  height: 73,
                  width: 73,
                ),
              ),
              Container(
                child: Icon(Icons.camera_alt, color: Colors.white, size: 40),
              )
            ],
          ),
        ),
        Container(
          child: Text("Add Status"),
        )
      ],
    );
  }
}

class Story extends StatelessWidget {
  Story({this.person});
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Colors.green[200], Colors.green[600]],
                    ),
                  ),
                  height: 73,
                  width: 73,
                ),
              ),
              ClipOval(
                child: Container(
                  height: 65,
                  width: 65,
                  color: Colors.white,
                ),
              ),
              ClipOval(
                child: Container(
                  height: 63,
                  width: 63,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(person.imgUrl),
                          fit: BoxFit.fill)),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Text(
            person.firstname,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
