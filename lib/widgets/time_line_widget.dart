import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 32, 8, 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TimelineTile(
              topLineStyle: LineStyle(
                color: Colors.orange.withOpacity(0.5),
              ),
              indicatorStyle: IndicatorStyle(
                width: 20,
                height: 20,
                color: Colors.orange,
                drawGap: true,
              ),
              alignment: TimelineAlign.manual,
              lineX: 0.3,
              rightChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                ),
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/bed1.jpg',
                          width: MediaQuery.of(context).size.width * 0.21,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '   3 hours ago',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.022),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  padding: EdgeInsets.all(1),
                                  child: Text(
                                    'Master Bed Room',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    overflow: TextOverflow.fade,
                                  )),
                              Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'A great master bed room with many functions',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.022),
                                  )),
                              Text(
                                'by : hard rock decor',
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              leftChild: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/mock/hardrock.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            TimelineDivider(
              begin: 0.3,
              end: 0.7,
              thickness: 6,
              color: Colors.orange.withOpacity(0.5),
            ),
            TimelineTile(
              topLineStyle: LineStyle(
                color: Colors.orange.withOpacity(0.5),
              ),
              indicatorStyle: IndicatorStyle(
                width: 20,
                height: 20,
                color: Colors.orange,
                drawGap: true,
              ),
              alignment: TimelineAlign.manual,
              lineX: 0.7,
              rightChild: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/mock/decor.png'),
                    ),
                  ],
                ),
              ),
              leftChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                ),
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/sofa1.jpg',
                          width: MediaQuery.of(context).size.width * 0.22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '   3 hours ago',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  padding: EdgeInsets.all(1),
                                  child: Text(
                                    'Master Bed Room',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    overflow: TextOverflow.fade,
                                  )),
                              Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'A great master bed room with many functions',
                                    style: TextStyle(
                                        fontSize:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.022),
                                  )),
                              Text(
                                'by : hard rock decor',
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TimelineDivider(
              begin: 0.3,
              end: 0.7,
              thickness: 6,
              color: Colors.orange.withOpacity(0.5),
            ),
            TimelineTile(
              topLineStyle: LineStyle(
                color: Colors.orange.withOpacity(0.5),
              ),
              indicatorStyle: IndicatorStyle(
                width: 20,
                height: 20,
                color: Colors.orange,
                drawGap: true,
              ),
              alignment: TimelineAlign.manual,
              lineX: 0.3,
              rightChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                ),
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/bed1.jpg',
                          width: MediaQuery.of(context).size.width * 0.21,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '   3 hours ago',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.022),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  padding: EdgeInsets.all(1),
                                  child: Text(
                                    'Master Bed Room',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    overflow: TextOverflow.fade,
                                  )),
                              Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'A great master bed room with many of functions',
                                    style: TextStyle(
                                        fontSize:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.022),
                                  )),
                              Text(
                                'by : hard rock decor',
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              leftChild: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/mock/hardrock.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            TimelineDivider(
              begin: 0.3,
              end: 0.7,
              thickness: 6,
              color: Colors.orange.withOpacity(0.5),
            ),
            TimelineTile(
              topLineStyle: LineStyle(
                color: Colors.orange.withOpacity(0.5),
              ),
              indicatorStyle: IndicatorStyle(
                width: 20,
                height: 20,
                color: Colors.orange,
                drawGap: true,
              ),
              alignment: TimelineAlign.manual,
              lineX: 0.7,
              rightChild: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/mock/decor.png'),
                    ),
                  ],
                ),
              ),
              leftChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                ),
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/sofa1.jpg',
                          width: MediaQuery.of(context).size.width * 0.22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '   3 hours ago',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  padding: EdgeInsets.all(1),
                                  child: Text(
                                    'Master Bed Room',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    overflow: TextOverflow.fade,
                                  )),
                              Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'A great master bed room with many functions',
                                    style: TextStyle(
                                        fontSize:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.022),
                                  )),
                              Text(
                                'by : hard rock decor',
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TimelineDivider(
              begin: 0.3,
              end: 0.7,
              thickness: 6,
              color: Colors.orange.withOpacity(0.5),
            ),
            TimelineTile(
              topLineStyle: LineStyle(
                color: Colors.orange.withOpacity(0.5),
              ),
              indicatorStyle: IndicatorStyle(
                width: 20,
                height: 20,
                color: Colors.orange,
                drawGap: true,
              ),
              alignment: TimelineAlign.manual,
              lineX: 0.3,
              rightChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                ),
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/bed1.jpg',
                          width: MediaQuery.of(context).size.width * 0.21,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '   3 hours ago',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.022),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  padding: EdgeInsets.all(1),
                                  child: Text(
                                    'Master Bed Room',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    overflow: TextOverflow.fade,
                                  )),
                              Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'A great master bed room with alot of functions',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.022),
                                  )),
                              Text(
                                'by : hard rock decor',
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              leftChild: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/mock/hardrock.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            TimelineDivider(
              begin: 0.3,
              end: 0.7,
              thickness: 6,
              color: Colors.orange.withOpacity(0.5),
            ),
            TimelineTile(
              topLineStyle: LineStyle(
                color: Colors.orange.withOpacity(0.5),
              ),
              indicatorStyle: IndicatorStyle(
                width: 20,
                height: 20,
                color: Colors.orange,
                drawGap: true,
              ),
              alignment: TimelineAlign.manual,
              lineX: 0.7,
              rightChild: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/mock/decor.png'),
                    ),
                  ],
                ),
              ),
              leftChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                ),
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/sofa1.jpg',
                          width: MediaQuery.of(context).size.width * 0.22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '   3 hours ago',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  padding: EdgeInsets.all(1),
                                  child: Text(
                                    'Master Bed Room',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    overflow: TextOverflow.fade,
                                  )),
                              Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'A great master bed room with alot of functions',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.022),
                                  )),
                              Text(
                                'by : hard rock decor',
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TimelineDivider(
              begin: 0.3,
              end: 0.7,
              thickness: 6,
              color: Colors.orange.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
