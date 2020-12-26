import 'dart:convert';

import 'package:flutter/cupertino.dart';


class Validation{
  String confirm_pass;
  BuildContext context;
  Validation(this.context);
  Validation.pass(String value){
    confirm_pass=value;

  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }
  String passValidator(String value) {
    if (value.length < 8) {
      return "password less than 8 char";
    } else {
      return null;
    }
  }
  String empty(String value) {
    if (value.length == 0) {
      return "please enter your data";
    } else {
      return null;
    }
  }
  String mobile(String value) {
    if (value.length < 11) {
      return "mobile num less than 11";
    } else {
      return null;
    }
  }
  String matchPassword(String value) {
    if (!(value == confirm_pass)) {
      return "password not match";
    } else {
      return null;
    }
  }

 /* Future<String>signin(data,url,type)async{
    final  response= await api.post(BASE_URL+url,data);
    if(json.decode(response.body)['success']){
      shared.setUser(User(json.decode(response.body)['data']['id'].toString(),type));
      User user= await shared.getUser();
      return user.id;
    }
    return "";





  }*/
}
