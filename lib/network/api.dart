import 'dart:convert';

import 'package:http/http.dart' as http;

class Api{

  Future<Map>get(url)async {
    http.Response response = await http.get(url,headers: {'Content-Type': "application/json; charset=utf-8",
      'Accept': 'application/json',
      'Authorization': 'Token db9106ea2519696c8bdbc4eefc120e616a29cf72'},);
    print(json.decode(response.body));


    return json.decode(response.body);

  }
  Future<Map>get_with_body(url,params)async {
    Uri uri = Uri.parse(url);
     final newURI = uri.replace(queryParameters: params);

    http.Response response = await http.get(newURI, headers: {
      "Authorization":  'Token db9106ea2519696c8bdbc4eefc120e616a29cf72',
    'Content-Type': "application/json; charset=utf-8",
    'Accept': 'application/json',
    });


    return json.decode(response.body);

  }
  dynamic getWithoutHeader(String url) async {
    http.Response response = await http.get(url);
    return response;
  }
  Future<http.Response> post(url, data) async{
    return await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token db9106ea2519696c8bdbc4eefc120e616a29cf72'
      },

      body:json.encode(data),

    );
  }
  Future<http.Response> postWithoutBody(url) async{
    return await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },


    );
  }


}
Api api=Api();