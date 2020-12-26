import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insideapp/screens/requests/materials.dart';

class BaseRequest extends StatefulWidget {
  String type;
  IconData icon;

  BaseRequest({
    Key key,
    @required this.type,
    @required this.icon,
  }) : super(key: key);

  @override
  _BaseRequestState createState() => _BaseRequestState();
}

class _BaseRequestState extends State<BaseRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Icon(
            widget.icon,
            color: Colors.orangeAccent,
          ),
          SizedBox(
            width: 10,
          ),
          Text('${widget.type}'),
        ],
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: widget.type == "Construction"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      minWidth: 270.0,
                      height: 100.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Materials(type: 'Construction Contract');
                          }));
                        },
                        splashColor: Colors.orangeAccent,
                        padding: EdgeInsets.all(16),
                        color: Colors.white,
                        elevation: 10,
                        child: Text('Construction Contract'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                      minWidth: 200.0,
                      height: 100.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Materials(type: 'With Finishing');
                          }));
                        },
                        splashColor: Colors.orangeAccent,
                        padding: EdgeInsets.all(16),
                        color: Colors.white,
                        elevation: 10,
                        child: Text(
                          'Construction Contract With Finishing',
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
