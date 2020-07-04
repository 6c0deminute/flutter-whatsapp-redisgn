import 'dart:ui';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/Person.dart';

Color kPrimaryColor = Color(0xFF075E55);

//https://imgur.com/a/n9LVVqX

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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp by CodeMinute'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: Column(
        children: <Widget>[
          Stories(),
          Expanded(child: ChatList()),
        ],
      ),

      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.white,
          selectedItemBackgroundColor: kPrimaryColor,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: 0,
        onSelectTab: (index) {},
        items: [
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Chats',
          ),
          FFNavigationBarItem(
            iconData: Icons.group,
            label: 'Groups',
          ),
          FFNavigationBarItem(
            iconData: Icons.phone,
            label: 'Calls',
          ),
          FFNavigationBarItem(
            iconData: Icons.star,
            label: 'Favorites',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Settings',
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Stories extends StatelessWidget {
  Stories({List<Person> people});
  final List<Person> people = Person.getPeople();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.only(top: 12),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          OwnStory(),
          ...people.map((e) => Story(
                person: e,
              ))
        ],
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
                        colors: [Colors.green[200], Colors.green[600]]),
                  ),
                  width: 73,
                  height: 73,
                ),
              ),
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(),
                  width: 63,
                  height: 63,
                ),
              ),
              ClipOval(
                child: Container(
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 40,
                  ),
                  width: 63,
                  height: 63,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Text(
            "Add Status",
            overflow: TextOverflow.ellipsis,
          ),
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
          margin: EdgeInsets.only(left: 0, right: 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.green[700], Colors.green[100]]),
                  ),
                  width: 73,
                  height: 73,
                ),
              ),
              ClipOval(
                child: Container(
                  color: Colors.white,
                  width: 65,
                  height: 65,
                ),
              ),
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(person.imgUrl),
                    ),
                  ),
                  width: 63,
                  height: 63,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 0, right: 10),
          child: Text(
            person.firstname,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
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
                        image: NetworkImage(person.imgUrl),
                        fit: BoxFit.cover)),
              ),
            ),
            title: Text(
              "${person.firstname} ${person.lastname}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(person.lastMsg, overflow: TextOverflow.ellipsis,),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(person.time),
                if(person.firstname == 'Plisi')
                ClipOval(child:
                  Container(width: 21, height: 21,color: kPrimaryColor, child: Center(child: Text("2", style: TextStyle(color: Colors.white),)),)
                  )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
        margin: EdgeInsets.only(top: 15),
        color: Colors.grey[100],
        child: ListView(
          children: <Widget>[
            ...people.map((e) => _buildChat(person: e))
          ],
        ));
  }
}
