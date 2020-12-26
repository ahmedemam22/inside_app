import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insideapp/screens/login.dart';
import 'package:insideapp/screens/register.dart';
import 'package:shared_preferences/shared_preferences.dart';


class JoinApp extends StatefulWidget {
  String message;
  JoinApp(
      {Key key,
        this.message})
      : super(key: key);

  @override
  _JoinAppState createState() => _JoinAppState();
}



class _JoinAppState extends State<JoinApp> with SingleTickerProviderStateMixin{

  TabController _tabController;

  Future clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    preferences.setString('theUrl', '10.0.2.2:8000');
  }

  @override
  void initState() {
    clearPrefs();
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).accentColor,
          labelColor: Theme.of(context).accentColor,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
          tabs: <Widget>[
            Tab(
              text: "User",
            ),
            Tab(
              text: "Supplier",
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          LoginScreen(message: widget.message,),
          RegisterScreen(),
        ],
      ),


    );
  }
}
