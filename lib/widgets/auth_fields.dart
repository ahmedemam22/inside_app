import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final bool isPassword;
  final bool isNumbers;
  final String label;
  final Icon icon;
  Function validate;
  final controller;



  AuthField({this.isPassword, this.isNumbers, this.label, this.icon,this.validate,this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: controller,
        validator: validate,

        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        obscureText: isPassword,
        keyboardType: isNumbers ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: "$label",
          labelStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
