import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:insideapp/screens/main_screen.dart';
import 'package:insideapp/screens/profile.dart';
import 'package:insideapp/screens/search.dart';
import 'package:insideapp/screens/support.dart';
import 'package:insideapp/screens/time_line.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;

  const BottomBar({Key key, @required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: [
        TabItem(icon: Icons.timeline, title: 'TimeLine'),
        TabItem(icon: Icons.search, title: 'Search'),
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.help, title: 'Support'),
        TabItem(icon: Icons.people, title: 'Profile'),
      ],
      initialActiveIndex: currentIndex,
      //optional, default as 0
      onTap: (int i) {
        if (i == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return TimeLine();
              },
            ),
          );
        } else if (i == 1) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return SearchScreen();
              },
            ),
          );
        } else if (i == 2) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return MainScreen();
              },
            ),
          );
        } else if (i == 3) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Support();
              },
            ),
          );
        } else if (i == 4) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Profile();
              },
            ),
          );
        }
      },
      color: Colors.orange,
      backgroundColor: Colors.white,
      activeColor: Colors.amber,
    );
  }
}
