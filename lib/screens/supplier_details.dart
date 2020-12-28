import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:insideapp/models/supplier.dart';
import 'package:insideapp/util/furnitures.dart';
import 'package:insideapp/widgets/badge.dart';
import 'package:insideapp/widgets/grid_product.dart';
import 'package:insideapp/widgets/slider_item.dart';
import 'package:insideapp/widgets/supplier/reviews.dart';
import 'package:insideapp/models/login_supplier_response.dart';
import 'package:video_player/video_player.dart';

import 'notifications.dart';

class SupplierDetails extends StatefulWidget {
  final  currentSupplier;

  SupplierDetails({Key key, @required this.currentSupplier}) : super(key: key);

  @override
  _SupplierDetailsState createState() => _SupplierDetailsState();
}

class _SupplierDetailsState extends State<SupplierDetails> {
  int _selectedTab;
  VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'http://techslides.com/demos/sample-videos/small.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage('${widget.currentSupplier.image}'),
                  radius: 15,
                ),
                Text(
                  '${widget.currentSupplier.name}',
                  style: TextStyle(
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .width * 0.037),
                )
              ],
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: IconBadge(
                  icon: Icons.notifications,
                  size: 22.0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Notifications();
                      },
                    ),
                  );
                },
              ),
            ],
            bottom: TabBar(
              onTap: (int index) {
                _selectedTab = index;
                if (index == 3) {
                  _controller.play();
                } else {
                  _controller.pause();
                }
                setState(() {});
              },
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.insert_drive_file,
                    color:
                        _selectedTab == 0 ? Colors.orangeAccent : Colors.black,
                  ),
                  text: 'Portfolio',
                ),
                Tab(
                    icon: Icon(
                      Icons.image_sharp,
                      color: _selectedTab == 1
                          ? Colors.orangeAccent
                          : Colors.black,
                    ),
                    text: 'Gallery'),
                Tab(
                    icon: Icon(
                      Icons.star,
                      color: _selectedTab == 2
                          ? Colors.orangeAccent
                          : Colors.black,
                    ),
                    text: 'Reviews'),
                Tab(
                    icon: Icon(
                      Icons.phone,
                      color: _selectedTab == 3
                          ? Colors.orangeAccent
                          : Colors.black,
                    ),
                    text: 'Contact'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildingSupplierPortfolio(context),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      ],
                    ),

                    SizedBox(height: 10.0),

                    //Slider Here

                    CarouselSlider(
                      height: MediaQuery.of(context).size.height / 2.4,
                      items: map<Widget>(
                        furnitures,
                        (index, i) {
                          Map food = furnitures[index];
                          return SliderItem(
                            img: food['img'],
                            isFav: false,
                            name: food['name'],
                            rating: 5.0,
                            raters: 23,
                            supplier: widget.currentSupplier.name,
                            supplierImg: widget.currentSupplier.image,
                          );
                        },
                      ).toList(),
                      autoPlay: true,
                      viewportFraction: 1.0,
                      onPageChanged: (index) {},
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      //physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.25),
                      ),
                      itemCount: furnitures == null ? 0 : furnitures.length,
                      itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                        Map food = furnitures[index];
//                print(foods);
//                print(foods.length);
                        return GridProduct(
                          img: food['img'],
                          isFav: false,
                          name: food['name'],
                          rating: 5.0,
                          raters: 23,
                        );
                      },
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
              // TimeLineWidget(),
              Reviews(),
              Column(
                children: [
                  _controller.value.initialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Chose an option'),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(elevation: 10,
                        color: Colors.orangeAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.black,
                              ),
                              Text(
                                'Outside In Assist',
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 10,
                                  ),
                                  Text(
                                    'Recommended',
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              )

                            ],
                          ),
                        ),),
                      Card(elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.call),
                              Text('Direct call'),
                            ],
                          ),
                        ),),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Padding buildingSupplierPortfolio(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('${widget.currentSupplier.image}'),
                  radius: 35,
                  backgroundColor: Colors.white,
                ),
                Text(
                  '${widget.currentSupplier.name}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                      MediaQuery
                          .of(context)
                          .size
                          .width * 0.05),
                ),
              ],
            ),
            Divider(color: Colors.orangeAccent, thickness: 2),
            SizedBox(
              height: 10,
            ),
            Text('Established : ${widget.currentSupplier.established}',
              style: TextStyle(color: Colors.black),),
            SizedBox(
              height: 10,
            ),
            Text(
              'Bio: ${widget.currentSupplier.bio}',
              style: TextStyle(color: Colors.black),),
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 2.0,
              items: map<Widget>(
                furnitures,
                    (index, i) {
                  Map food = furnitures[index];
                  return SliderItem(
                    supplierImg: widget.currentSupplier.image,
                    supplier: widget.currentSupplier.name,
                    img: food['img'],
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
          ],
        ),
      ),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
