import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insideapp/models/supplier.dart';
import 'package:insideapp/screens/supplier_details.dart';
import 'package:insideapp/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:insideapp/providers/supplier_provider.dart';

class SupplierList extends StatefulWidget {
  final IconData iconName;
  final String categoryName;

  SupplierList({Key key, @required this.iconName, @required this.categoryName})
      : super(key: key);

  @override
  _SupplierListState createState() => _SupplierListState();
}

class _SupplierListState extends State<SupplierList> {
  

  @override
  void initState() {
    Provider.of<SupplierProvider>(context,listen: false).get_suppliers().then((value) => null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
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
                    /*    gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.orangeAccent,
                      Colors.orange,
                      Colors.black,
                    ])*/),
                    // color: Colors.orangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
/*
                                  Flag(
                                    'us',
                                    height: 40,
                                    width: 40,
                                  ),
*/
                                  Text(
                                    'EN',
                                    style: TextStyle(color: Colors.black),
                                  ),
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.1,
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
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    widget.iconName,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.categoryName}',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.orangeAccent,
              ),
              Flexible(
                child: Consumer<SupplierProvider>(
                    builder: (ctx, data, child) =>
                 data.suppliers==null?Center(child: CircularProgressIndicator(backgroundColor: Colors.blue,),) :ListView(
                    children: data.suppliers.map((e) {

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpansionTileCard(
                          baseColor: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          title: Text(
                            '${e.name??""}', style: TextStyle(color: Colors.black),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             /*Text('${e.bio??""}',
                                style: TextStyle(color: Colors.black),),
                              SizedBox(
                                height: 5,
                              ),*/
                              Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.orangeAccent
                                              .withOpacity(0.9))),
                                  child: Image.network('${e.image}'))
                            ],
                          ),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage('${e.logo}'),
                            backgroundColor: Colors.white,
                          ),
                          children: [
                            Divider(
                              thickness: 1.0,
                              height: 1.0,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text(
                                  '${e.bio}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceAround,
                              buttonHeight: 52.0,
                              buttonMinWidth: 90.0,
                              children: [
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return SupplierDetails(
                                            currentSupplier: e,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.doorOpen),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                      ),
                                      Text('Show Provider Profile'),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
