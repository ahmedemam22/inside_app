import 'package:flutter/material.dart';
import 'package:insideapp/widgets/profile_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name;
  String mobile;



  Future<void> getUserData() async {
    await SharedPreferences.getInstance().then((prefs) {
      name = prefs.getString('userName');
      mobile = prefs.getString('userMobile');
      setState(() {});
    });
  }
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileWidget(name: name, mobile: mobile),
    );
  }
}
