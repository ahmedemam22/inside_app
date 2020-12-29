import 'package:flutter/cupertino.dart';
import 'package:insideapp/models/request_submit_model.dart';
import 'package:insideapp/models/finish_request_model.dart';
import 'package:insideapp/network/api.dart';
import 'package:insideapp/network/constant.dart';
class RequestSubmitProvider extends ChangeNotifier{
Future make_request(var request,type)async{


  await api.post(BASE_URL+REQUEST, set_data(request, type));

}
Map<String,dynamic>set_data(var request,type) {
  var data;
  if (type == "contractor") {
     data = {
      'material_on_client': request.material_on_client,
      'ownership_of_land': request.owner_ship,
      'building_permit': request.building_permit,
      'supported_geometry_diagram': request.geometry_diagram,
      'building_type': request.buildingType,
      'building_type': request.buildingType,
      'numbers_of_floors': request.floor_num,
      'apart_per_floor': request.floor_apartment,
      'location_main': request.location,
      'location_city': request.sub_location,
      'land_area': request.land_area,
      'building_area': request.building_area,
      'budget': request.budget,
      'notes': request.notes,


    };
  }
  else{
    data= {
      'building_type': request.buildingType,
      'full_finishing': request.full_finishing,
      'current_status': request.current_status,
      'building_area': request.area,
      'number_of_rooms': request.room_num,
      'number_of_Bathrooms': request.bathroom_num,
      'location_main': request.location,
      'location_city': request.city_location,
      'budget': request.budget,
      'requested_finishing': request.request_finishing,


      // 'partial_finishing': request.partial_finishing,

    };
}
  return data;
}
}