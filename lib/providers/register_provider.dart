import 'package:flutter/cupertino.dart';
import 'package:insideapp/network/api.dart';
import 'package:insideapp/network/constant.dart';
class RegisterProvider extends ChangeNotifier{
  bool _wait_supplier_register=false;
  bool get wait_supplier_register=>_wait_supplier_register;
  bool _wait_client_register=false;
  bool get wait_client_register=>_wait_client_register;
  supplier_register(data)async{
   try{
     _wait_supplier_register=true;
     notifyListeners();
     await api.post(BASE_URL+SUPPLIER_REGISTER, data);}
     catch(e){
     print("error register::$e");
     }
     finally{
       _wait_supplier_register=false;
       notifyListeners();
     }
  }
  client_register()async{
    try{
      _wait_client_register=true;
      notifyListeners();
      await api.post(BASE_URL+CLIENT_REGISTER, {"name":"s","mobile":"","password":""});}
    catch(e){
      print("error register::$e");
    }
    finally{
      _wait_client_register=false;
      notifyListeners();
    }
  }

}