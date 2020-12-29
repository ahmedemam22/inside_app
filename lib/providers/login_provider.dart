import 'package:flutter/cupertino.dart';
import 'package:insideapp/models/login_client_response.dart';
import 'package:insideapp/models/login_supplier_response.dart';
import 'package:insideapp/network/api.dart';
import 'package:insideapp/network/constant.dart';
import 'package:insideapp/util/awesome_dialog.dart';
import 'package:insideapp/util/shared.dart';
class LoginProvider extends ChangeNotifier {
  bool _wait_supplier_login = false;

  bool get wait_supplier_login => _wait_supplier_login;
  bool _wait_client_login = false;

  bool get wait_client_register => _wait_client_login;
  List<LoginclientResponse>login_clients;
  List<LoginSupplierResponse>login_suppliers;
 bool is_active=false;

  Future login_client(mobile, pass, context) async {
    login_clients = [];
    try {
      _wait_supplier_login = true;
      notifyListeners();
      var reponse = await api.get(BASE_URL + CLIENT_REGISTER);
      reponse.forEach((element) {
        login_clients.add(LoginclientResponse.fromJson(element));
      });
    }
    catch (e) {
      print("error login ::$e");
    }
    finally {
      _wait_supplier_login = false;
      notifyListeners();
     bool login= await is_login(mobile, pass, false);
      if (login)
        Navigator.pushReplacementNamed(context, '/home');
      else
        awesome_dialog(context,"Error login","please check your email and password");
    }
  }

  login_supplier(mobile, pass, context) async {
    login_suppliers = [];
    try {
      _wait_supplier_login = true;
      notifyListeners();
      var reponse = await api.get(BASE_URL + SUPPLIER_REGISTER);
      reponse.forEach((element) {
        login_suppliers.add(LoginSupplierResponse.fromJson(element));
      });
    }
    catch (e) {
      print("error login ::$e");
    }
    finally {
      _wait_supplier_login = false;
      notifyListeners();
      bool login= await is_login(mobile, pass, true);

      if (login)
        if(is_active){
        Navigator.pushReplacementNamed(context, '/supplier_home');}
        else awesome_dialog(context,"Account Active","account is not active yet");
      else
        awesome_dialog(context,"Error login","please check your email and password");
    }
  }

  Future<bool> is_login(mobile, pass, is_supplier)async {
    bool check = false;
    if (!is_supplier) {
      login_clients.forEach((element) async{
        if (element.mobile == mobile && element.password == pass)  {
          check = true;
          await shared.setUser(element.id, 'client',element.name);

        }
      });
    }
    else {
      login_suppliers.forEach((element) async{
        if (element.mobile == mobile && element.password == pass) {
          is_active=element.isActive;
          if(is_active)  {
            check = true;
            await shared.setUser(element.id, 'supplier',element.name);

          }

        }
      });
    }
    return check;
  }
}
