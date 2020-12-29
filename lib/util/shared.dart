import 'package:shared_preferences/shared_preferences.dart';

import 'package:insideapp/globals.dart';
class Shared{
  SharedPreferences preferences;
 Future setUser( id,type,name)async{
    preferences=await SharedPreferences.getInstance();
    preferences.setString('id',id.toString() );
    preferences.setString('type',type );
    preferences.setString('name',name );
    print("idddddddddd");

  }
  Future getUser()async{
    preferences=await SharedPreferences.getInstance();
    if(preferences.getString('id')!=null){
    Globals.id=int.parse(preferences.getString('id'));
    Globals.type=preferences.getString('type');
    Globals.name=preferences.getString('name');

    }


  }

}
Shared shared=Shared();