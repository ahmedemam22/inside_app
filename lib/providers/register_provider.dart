import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:insideapp/network/api.dart';
import 'package:insideapp/network/constant.dart';
import 'package:insideapp/util/awesome_dialog.dart';
class RegisterProvider extends ChangeNotifier{
  bool _wait_supplier_register=false;
  bool get wait_supplier_register=>_wait_supplier_register;
  bool _wait_client_register=false;
  bool get wait_client_register=>_wait_client_register;
  supplier_register(data,context)async{
   try{
     _wait_supplier_register=true;
     notifyListeners();
     var reponse=await api.post(BASE_URL+SUPPLIER_REGISTER, data);
   if(reponse.statusCode==400){
     awesome_dialog(context,'Error Registration','this mobile already exists.');

   }
   }
     catch(e){
     print("error register::$e");
     }
     finally{
       _wait_supplier_register=false;
       notifyListeners();
     }
  }
  client_register(data,context)async{
    try{
      _wait_client_register=true;
      notifyListeners();
     var response= await api.post(BASE_URL+CLIENT_REGISTER,data);
     print(json.decode(response.body));
     print("ssssssssss");
      if(response.statusCode==400){
        awesome_dialog(context,'Error Registration','this mobile already exists.');

      }
    }
    catch(e){
      print("error register::$e");
    }
    finally{
      _wait_client_register=false;
      notifyListeners();
    }
  }

}