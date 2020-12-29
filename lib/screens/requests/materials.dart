import 'package:flutter/material.dart';
import 'package:insideapp/screens/requests/contractors_form.dart';
import 'package:insideapp/models/request_submit_model.dart';

class Materials extends StatefulWidget {
  final String type;

  Materials({Key key, @required this.type}) : super(key: key);

  @override
  _MaterialsState createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              ButtonTheme(
                minWidth: 270.0,
                height: 100.0,
                child: RaisedButton(
                  onPressed: widget.type == "Construction Contract"
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ContractorsForm(
                                materialType: "Material On Contractor",
                                contractType: widget.type);
                          }));
                        }
                      : () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ContractorsForm(
                                materialType: "Material On Contractor",
                                contractType: widget.type);
                          }));
                        },
                  splashColor: Colors.orangeAccent,
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  elevation: 10,
                  child: Text('Material on contractor'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 270.0,
                height: 100.0,
                child: RaisedButton(
                  onPressed: widget.type == "Construction Contract"
                      ? () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ContractorsForm(
                            materialType: "Material On Client",
                            contractType: widget.type,
                          );
                        }));
                  }
                      : () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ContractorsForm(
                            materialType: "Material On Client",
                            contractType: widget.type,

                          );
                        }));
                  },
                  splashColor: Colors.orangeAccent,
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  elevation: 10,
                  child: Text(
                    'Material on client',
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
