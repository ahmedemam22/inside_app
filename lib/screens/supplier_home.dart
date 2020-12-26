import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:insideapp/screens/splash.dart';
import 'package:insideapp/util/furnitures.dart';
import 'package:insideapp/widgets/profile_widget.dart';
import 'package:insideapp/widgets/slider_item.dart';
import 'package:insideapp/widgets/supplier/supplier_shops.dart';

class SupplierHome extends StatefulWidget {
  @override
  _SupplierHomeState createState() => _SupplierHomeState();
}

class _SupplierHomeState extends State<SupplierHome> {
  int index;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          floatingActionButton: index == 0
              ? FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                  backgroundColor: Colors.orangeAccent,
                )
              : SizedBox(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Supplier name here'),
                IconButton(
                  icon: Icon(Icons.logout, color: Colors.red),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SplashScreen();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
            bottom: TabBar(
              onTap: (int index) {
                index = index;
                setState(() {});
              },
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.store_mall_directory,
                  ),
                  text: 'Shops',
                ),
                Tab(
                  icon: Icon(
                    Icons.insert_drive_file_rounded,
                  ),
                  text: 'Portfolio',
                ),
                Tab(
                  icon: Icon(
                    Icons.attach_money,
                  ),
                  text: 'plan',
                ),
                Tab(
                  icon: Icon(
                    Icons.supervised_user_circle_sharp,
                  ),
                  text: 'Profile',
                ),
              ],
            ),

          ),
          body: TabBarView(
            children: [
              SupplierShopsWidget(),
              buildingSupplierPortfolio(context),
              Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning),
                      Text('This section still under construction')
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileWidget(name: 'Test Supplier', mobile: '01111111'),
              ),
            ],
          )),
    );
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
                  backgroundImage: AssetImage('assets/mock/decor.png'),
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
                Text(
                  'Mansour Decoration Est.',
                  style: TextStyle(
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .width * 0.04),
                ),
                IconButton(icon: Icon(Icons.edit, color: Colors.grey,),
                    onPressed: () {})
              ],
            ),
            Divider(color: Colors.orangeAccent, thickness: 2),
            SizedBox(
              height: 10,
            ),
            Text('Established : 2001'),
            SizedBox(
              height: 10,
            ),
            Text(
                'Bio: Cool Decor Company is a wholesale distributor for a well-curated selection of quality design gifts, home accessories, and lifestyle products. We represent some of the best design brands from Europe, combining for a collection that stands out because of its aesthetics, quality and originality. Our collection represents a cool mix of products for both adults and kids that are meant to spark a positive emotion when see or use them.'),
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              height: MediaQuery.of(context).size.height / 2.0,
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
