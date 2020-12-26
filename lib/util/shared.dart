import 'package:shared_preferences/shared_preferences.dart';
import 'package:insideapp/models/supplier.dart';
class Shared{
  SharedPreferences preferences;
  setUser(SupplierModel user)async{
    preferences=await SharedPreferences.getInstance();
    preferences.setString('id',user.name );
    preferences.setString('type',user.desc );

  }
  Future<SupplierModel> getUser()async{
    preferences=await SharedPreferences.getInstance();
    SupplierModel supplierModel=SupplierModel();//preferences.getString('id'),preferences.getString('type'));


    return supplierModel;
  }

}