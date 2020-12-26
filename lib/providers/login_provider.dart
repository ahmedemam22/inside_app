import 'package:flutter/cupertino.dart';
import 'package:insideapp/network/api.dart';
import 'package:insideapp/network/constant.dart';
class LoginProvider extends ChangeNotifier{
  bool _wait_supplier_login=false;
  bool get wait_supplier_login=>_wait_supplier_login;
  bool _wait_client_login=false;
  bool get wait_client_register=>_wait_client_login;
  login_supplier(params)async{
  try {
    _wait_supplier_login=true;
    notifyListeners();
    await api.get_with_body(BASE_URL + CLIENT_REGISTER, params);
  }
  catch(e){
    print("error login ::$e");
  }
  finally{
    _wait_supplier_login=false;
    notifyListeners();
    }
  }
  login_client()async{


  }

}