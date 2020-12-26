import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OtherForm extends StatefulWidget {
  @override
  _OtherFormState createState() => _OtherFormState();
}

class _OtherFormState extends State<OtherForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              FontAwesomeIcons.thList,
              color: Colors.orangeAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Other'),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Fill Request details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(
              thickness: 3,
              color: Colors.orangeAccent,
              height: 40,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 4000,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.orangeAccent, width: 2.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Your message here',
              ),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.orangeAccent,
              child: Text('Submit'),
            )
          ],
        ),
      )),
    );
  }
}
