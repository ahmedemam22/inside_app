import 'package:flutter/material.dart';
import 'package:insideapp/widgets/bottom_bar.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomBar(
          currentIndex: 3,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Contact Outside In team',
              style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // Add TextFormFields and RaisedButton here.
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: DropdownButtonFormField(
                              hint: Text('Please Select Category'),
                              items: <DropdownMenuItem>[
                                DropdownMenuItem<String>(
                                    value: "text1", child: Text("test")),
                                DropdownMenuItem<String>(
                                    value: "text2", child: Text("test")),
                                DropdownMenuItem<String>(
                                    value: "text3", child: Text("test")),
                                DropdownMenuItem<String>(
                                    value: "text4", child: Text("test")),
                              ],
                              onChanged: (_) {},
                              validator: (value) {
                                if (value == null) {
                                  return 'Please choose category';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              //Normal textInputField will be displayed
                              maxLines: 5,
                              decoration: InputDecoration.collapsed(
                                  border: new OutlineInputBorder(
                                    borderSide: new BorderSide(),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Text of your message'),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter Message here';
                                }
                                return null;
                              },
                            ),
                          ),
                          RaisedButton(
                            color: Colors.orange,
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.

                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Send',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Text(
                              'Our Team will contact you as soon as possible after sending this message')
                        ]),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
