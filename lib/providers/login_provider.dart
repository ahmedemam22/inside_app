import 'package:flutter/cupertino.dart';
import 'package:insideapp/models/login_client_response.dart';
import 'package:insideapp/network/api.dart';
import 'package:insideapp/network/constant.dart';
import 'package:insideapp/util/awesome_dialog.dart';
class LoginProvider extends ChangeNotifier{
  bool _wait_supplier_login=false;
  bool get wait_supplier_login=>_wait_supplier_login;
  bool _wait_client_login=false;
  bool get wait_client_register=>_wait_client_login;
  List<LoginclientResponse>login_clients;

  Future login_supplier(mobile,pass,context)async{
    login_clients=[];
  try {
    _wait_supplier_login=true;
    notifyListeners();
   var reponse= await api.get(BASE_URL + CLIENT_REGISTER);
  reponse.forEach((element) {
    login_clients.add(LoginclientResponse.fromJson(element));
    print(element['name']);
    print("mmmmmmmmmmmm");
    print(login_clients[0].name);

  });

  }
  catch(e){
    print("error login ::$e");
  }
  finally{

    _wait_supplier_login=false;
    notifyListeners();
   if( is_login(mobile,pass))Navigator.pushReplacementNamed(context, '/home');
   else awesome_dialog(context);

  }
  }
  login_client()async{


  }
 bool is_login(mobile,pass){
bool check =false;
    login_clients.forEach((element) {
      if (element.mobile == mobile && element.password == pass){
        print("ssssssssssssssss");
        check= true;
      }
    });
    return check;

    }
  }

