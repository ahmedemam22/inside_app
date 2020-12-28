import 'package:flutter/cupertino.dart';
import 'package:insideapp/models/login_supplier_response.dart';
import 'package:insideapp/network/constant.dart';
import 'package:insideapp/network/api.dart';
class SupplierProvider extends ChangeNotifier{
  bool _wait_get_suppliers = false;

  bool get wait_get_suppliers => _wait_get_suppliers;
  List<LoginSupplierResponse>suppliers;
  get_suppliers()async{
    suppliers=[];
    try {
      _wait_get_suppliers = true;
      notifyListeners();
      var reponse = await api.get(BASE_URL + SUPPLIER_REGISTER);
      reponse.forEach((element) {
        suppliers.add(LoginSupplierResponse.fromJson(element));
      });
    }
    catch(e){

    }
    finally{
      _wait_get_suppliers=false;
      notifyListeners();
    }
  }


}