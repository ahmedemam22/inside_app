import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insideapp/screens/contact_us.dart';
import 'package:insideapp/screens/profile.dart';
import 'package:insideapp/screens/requests/base_request.dart';
import 'package:insideapp/screens/requests/finish_form.dart';
import 'package:insideapp/screens/search.dart';
import 'package:insideapp/screens/supplier_list.dart';
import 'package:insideapp/screens/time_line.dart';
import 'package:insideapp/util/furnitures.dart';
import 'package:insideapp/widgets/custom_app_bar_image.dart';
import 'package:insideapp/widgets/slider_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  int currentIndex;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  void initState() {
    currentIndex = 0;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        activeColor: Colors.black,
        backgroundColor: Color(0xffb0dd99),
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.timeline, title: 'TimeLine'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        //optional, default as 0
        onTap: (int i) {
          currentIndex = i;
          setState(() {});
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBarImage(),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
        child: currentIndex == 0
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Slider Here
                    CarouselSlider(
                      height: MediaQuery.of(context).size.height / 3.3,
                      items: map<Widget>(
                        furnitures,
                        (index, i) {
                          Map food = furnitures[index];
                          return SliderItem(
                            img: food['img'],
                            supplier: 'The test supplier',
                            supplierImg: 'assets/mock/decor.png',
                            isFav: false,
                            name: food['name'],
                            rating: 5.0,
                            raters: 23,
                          );
                        },
                      ).toList(),
                      autoPlay: true,
//                enlargeCenterPage: true,
                      viewportFraction: 1.0,
//              aspectRatio: 2.0,
                      onPageChanged: (index) {},
                    ),
                    SizedBox(height: 15.0),
//Old higher rated part
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Service Providers',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Center(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return SupplierList(
                                              iconName:
                                                  FontAwesomeIcons.hardHat,
                                              categoryName: "Construction",
                                            );
                                          }));
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    ButtonTheme(
                                                      minWidth: 60.0,
                                                      height: 60.0,
                                                      child: RaisedButton(
                                                        color: Colors.white,
                                                        shape:
                                                            new CircleBorder(),
                                                        elevation: 5,
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .hardHat,
                                                          color:
                                                              Color(0xffb0dd99),
                                                          size: 25,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                            return SupplierList(
                                                              iconName:
                                                                  FontAwesomeIcons
                                                                      .hardHat,
                                                              categoryName:
                                                                  "Construction",
                                                            );
                                                          }));
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Construction',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return SupplierList(
                                              iconName:
                                                  FontAwesomeIcons.paintRoller,
                                              categoryName: "Finishing",
                                            );
                                          }));
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    ButtonTheme(
                                                      minWidth: 60.0,
                                                      height: 60.0,
                                                      child: RaisedButton(
                                                        color: Colors.white,
                                                        shape:
                                                            new CircleBorder(),
                                                        elevation: 5,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(1.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .paintRoller,
                                                                size: 25,
                                                                color: Color(
                                                                    0xffb0dd99),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                            return SupplierList(
                                                              iconName:
                                                                  FontAwesomeIcons
                                                                      .paintRoller,
                                                              categoryName:
                                                                  "Finishing",
                                                            );
                                                          }));
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Finishing',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    //TODO:Remove this two

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Submit Request', style: TextStyle(
                                    color: Colors.black),),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      showRequestHelp();
                                    },
                                    child: Icon(
                                      Icons.help_outline,
                                      color: Colors.white70.withOpacity(0.5),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) {
                                                  return BaseRequest(
                                                    type: 'Construction',
                                                    icon: FontAwesomeIcons
                                                        .hardHat,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color(0xffb0dd99)
                                                          .withOpacity(0.5))),
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  RaisedButton(
                                                    color: Color(0xffb0dd99),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                          context) {
                                                            return BaseRequest(
                                                              type:
                                                              'Construction',
                                                              icon:
                                                                  FontAwesomeIcons
                                                                      .hardHat,
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .hardHat,
                                                          size: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    'Construction',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Text('request',
                                                    style: TextStyle(
                                                        color: Colors.black),),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) {
                                                  return FinishingForm();
                                                },
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color(0xffb0dd99)
                                                          .withOpacity(0.5))),
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  RaisedButton(
                                                    color: Color(0xffb0dd99),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                          context) {
                                                            return FinishingForm();
                                                          },
                                                        ),
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .paintRoller,
                                                          size: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    'Finishing',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Text('request',
                                                    style: TextStyle(
                                                        color: Colors.black),),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '---------------------',
                                      style:
                                      TextStyle(color: Colors.white),
                                    ),
                                    Text('OR'),
                                    Text(
                                      '---------------------',
                                      style:
                                      TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(80.0)),
                                    padding: const EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                /*        gradient: LinearGradient(
                                          colors: <Color>[
                                            Color.fromRGBO(255, 255, 255, 1),
                                            Color(0xffb0dd99),
                                            Color(0xffb0dd99),
                                            Color(0xffb0dd99),
                                            Color.fromRGBO(255, 255, 255, 1),
                                          ],
                                        ),*/
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80.0)),
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            minWidth: 88.0, minHeight: 36.0),
                                        // min sizes for Material buttons
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              'Contact Us',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight
                                                      .bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ContactUs()));
                                    }),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            : currentIndex == 1
                ? TimeLine()
                : currentIndex == 2
                    ? SearchScreen()
                    : Profile(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


  void showRequestHelp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Submit a request"),
            content: Text(
                "Let Outside In team help you decide where to find what you are asking for within your budge."),
          );
        }
    );
  }
}
