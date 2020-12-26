import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact US'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/logo/logo.png',
                    width: 100,
                    height: 100,
                  )),
              Text(
                'Outside In',
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.08),
              ),
              Divider(
                thickness: 2,
                color: Colors.orangeAccent,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.email),
                  Text('Email / Sales@outside-in.com ',
                    style: TextStyle(color: Colors.white),),
                  RaisedButton(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Icon(Icons.email, color: Colors.black),
                        ],
                      ),
                      onPressed: () async {
                        const url = 'mailto:Sales@outside-in.com';
                        await launch(url);
                      })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.phone),
                  Text('Phone/ +201207199086',
                    style: TextStyle(color: Colors.white),),
                  RaisedButton(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Icon(Icons.phone, color: Colors.black),
                        ],
                      ),
                      onPressed: () async {
                        const url = 'tel:+201207199086';
                        await launch(url);
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
