import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:insideapp/screens/main_screen.dart';
import 'package:insideapp/widgets/profile_tile.dart';

class PaymentSuccessPage extends StatefulWidget {

  final bool isCashOnDelivery;

  PaymentSuccessPage({Key key, this.isCashOnDelivery}) : super(key: key);

  @override
  PaymentSuccessPageState createState() {
    return new PaymentSuccessPageState();
  }
}

class PaymentSuccessPageState extends State<PaymentSuccessPage> {
  bool isDataAvailable = true;
  double totalPrice = 100.0;

  @override
  void initState() {
    super.initState();
  }

  Widget bodyData() => Center(
        child: isDataAvailable
            ? RaisedButton(
                shape: StadiumBorder(),
                onPressed: () => showSuccessDialog(),
                color: Theme.of(context).accentColor,
                child: Text("Process Payment"),
              )
            : CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyData(),
    );
  }

  void showSuccessDialog() {
    setState(() {
      isDataAvailable = false;
      Future.delayed(Duration(seconds: 3)).then((_) => goToDialog());
    });
  }

  goToDialog() {
    setState(() {
      isDataAvailable = true;
    });
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    successTicket(),

                  ],
                ),
              ),
            ));
  }

  successTicket() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Material(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          borderRadius: BorderRadius.circular(4.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: "Thank You!",
                  subtitle: "Your transaction was successful",
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 15),
                      child:Text("Date",style: TextStyle(fontSize: 16),)),
                  subtitle: Text(""),
                  trailing: Text(Jiffy().yMMMEdjm,style: TextStyle(fontSize: 16),),
                ),
                ListTile(
                  title: Text('Shahanj Parvin'),
                  subtitle: Text('putulcse9@gmail.com'),
                  trailing: CircleAvatar(
                    backgroundImage: AssetImage("assets/laura.png"),
                    radius: 32,
                  ),
                ),
                ListTile(
                  title: Text("Amount"),
                  subtitle: Text('\$'+totalPrice.toString()),
                  trailing: Text("Completed"),
                ),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0.0,
                  color: Theme.of(context).backgroundColor,
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.ccVisa,
                    ),
                    title: Text("Credit/Debit Card"),
                    subtitle: Text("PNB Card ending ***6"),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Container(
                    height: 40.0,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                      child: Text(
                        "OK",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return MainScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
