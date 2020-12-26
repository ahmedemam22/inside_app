import 'package:flutter/material.dart';
import 'package:insideapp/models/supplier.dart';
import 'package:insideapp/screens/supplier_details.dart';
import 'package:insideapp/util/const.dart';
import 'package:insideapp/widgets/smooth_star_rating.dart';

class SliderItem extends StatelessWidget {
  final String name;
  final String img;
  final String supplier;
  final String supplierImg;
  final bool isFav;
  final double rating;
  final int raters;

  SliderItem(
      {Key key,
      @required this.name,
      @required this.img,
      @required this.isFav,
      @required this.rating,
      @required this.supplier,
      @required this.supplierImg,
      @required this.raters})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],


          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 2.0),
            child: Text(
              "$name",
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
              maxLines: 2,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 1.0),
            child: Row(
              children: <Widget>[
                SmoothStarRating(
                  starCount: 5,
                  color: Constants.ratingBG,
                  allowHalfRating: true,
                  rating: rating,
                  size: 10.0,
                ),

                Text(
                  " $rating ($raters Reviews)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.0,
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  "By",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.0,
                  ),
                ),
                SizedBox(width: 3,),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('${supplierImg}'),
                ),
                SizedBox(width: 3,),
                Text(
                  "$supplier",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.0,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              SupplierModel e = SupplierModel(
                  name: 'Test Supplier',
                  bio: 'This is the best place to find everything you are looking for',
                  mobile: '01207199086',
                  established: '2011',
                  image: 'assets/mock/decor.png',
                  id: 3,
                  desc: 'Decoration is power');
              return SupplierDetails(
                currentSupplier: e,
              );
            },
          ),
        );
      },
    );
  }
}
