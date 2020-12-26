import 'package:flutter/material.dart';
import 'package:insideapp/screens/notifications.dart';
import 'package:insideapp/screens/supplier_details.dart';
import 'package:insideapp/util/const.dart';
import 'package:insideapp/util/furnitures.dart';
import 'package:insideapp/util/read_more_text.dart';
import 'package:insideapp/widgets/badge.dart';
import 'package:insideapp/widgets/smooth_star_rating.dart';

class ProductDetails extends StatefulWidget {

  final String productName;
  final String productImageAsset;

  ProductDetails({Key key, this.productName, this.productImageAsset}) : super(key: key);


  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.shopping_basket,
            color: Colors.black),
      ),
*/
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Details",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.productImageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  right: -10.0,
                  bottom: 3.0,
                  child: RawMaterialButton(
                    onPressed: (){},
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        isFav
                            ?Icons.favorite
                            :Icons.favorite_border,
                        color: Theme.of(context).accentColor,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),

          Padding(
             padding: EdgeInsets.all(10),
              child:Column(
            crossAxisAlignment : CrossAxisAlignment.start,
            children: <Widget>[
            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.productName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 2,
                ),

                Padding(
                  padding: EdgeInsets.only(right: 5.0, top: 2.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10.0),

                      Text(
                        "\$90",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).accentColor,
                        ),
                      ),

                    ],
                  ),
                ),
              ],),

            Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Row(
                children: <Widget>[
                  SmoothStarRating(
                    starCount: 5,
                    color: Constants.ratingBG,
                    allowHalfRating: true,
                    rating: 5.0,
                    size: 10.0,
                  ),
                  SizedBox(width: 10.0),
                          Text(
                            "5.0 (23 Reviews)",
                            style: TextStyle(
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return SupplierDetails();
                            },
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage('assets/mock/decor.png'),
                              ),
                              Text('Mansour Decoration Est.'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return SupplierDetails();
                                      },
                                    ),
                                  );
                                },
                                child: Text('Order'),
                                color: Colors.orangeAccent,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10.0),
                    ReadMoreText(description,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )),


/*
            SizedBox(height: 20.0),

            Text(
              "Reviews",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 20.0),

            ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: comments == null?0:comments.length,
              itemBuilder: (BuildContext context, int index) {
                Map comment = comments[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(
                      "${comment['img']}",
                    ),
                  ),

                  title: Text("${comment['name']}"),
                  subtitle: Column(
                    children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SmoothStarRating(
                                    starCount: 5,
                                    color: Constants.ratingBG,
                                    allowHalfRating: true,
                                    rating: 5.0,
                                    size: 12.0,
                                  ),
                                  SizedBox(width: 6.0),
                                  Text(
                                    "February 14, 2020",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 7.0),
                      Text(
                        "${comment["comment"]}",
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 10.0),
*/
                  ],))

          ],
        ),
      ),

    );
  }




}
