import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insideapp/screens/cart.dart';
import 'package:insideapp/screens/favorite_screen.dart';
import 'package:insideapp/screens/home.dart';
import 'package:insideapp/screens/profile.dart';
import 'package:insideapp/screens/search.dart';
import 'package:insideapp/widgets/custom_app_bar_image.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 40),
            child: CustomAppBarImage()),
        /*PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 40),
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.expand,
              children: [
                ClipPath(
                  clipper: CustomAppBar(),
                  child: Container(
                    // color: Colors.orangeAccent,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.orangeAccent,
                      Colors.orange,
                      Color(0xff370617),
                    ])),
                    // color: Colors.orangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
*/ /*
                                  Flag(
                                    'us',
                                    height: 40,
                                    width: 40,
                                  ),
*/ /*
                                  Text('EN', style: TextStyle(color: Colors.black),),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.notifications),
                                    color: Colors.white,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/logo/logo.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                              ),
                              Text(
                                'OutSide-In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ))*/
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            Home(),
            FavoriteScreen(),
            SearchScreen(),
            CartScreen(),
            Profile(),
          ],
        ),

      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
