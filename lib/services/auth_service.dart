import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String mobile;
  String password;
  String name;

  AuthService({this.name, this.mobile, this.password});

  Future<Map> doRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theUrl = '10.0.2.2:8000';
    print(theUrl);
    Client client = Client();
    try {
      var value =
          await client.post('http://$theUrl/panel/api/v1/Client/', headers: {
        'Authorization': 'Basic Vl93ck1wVC5rKjVlMiZVLjo+fkF1bVA/TU4zYmdzTllF',
      }, body: {
        'mobile': this.mobile,
        'name': this.name,
        'is_active': 'true',
      });
      final response = json.decode(utf8.decode(value.bodyBytes));
      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
  }

  Future<List<dynamic>> doLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theUrl = '10.0.2.2:8000';
    Client client = Client();
    try {
      var response =
      await client.get('http://$theUrl/panel/api/v1/Client/', headers: {
        'Authorization': 'Basic Vl93ck1wVC5rKjVlMiZVLjo+fkF1bVA/TU4zYmdzTllF',
      });
      final clients = json.decode(utf8.decode(response.bodyBytes));
      return clients;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
  }

  Future<Map> supplierJoin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theUrl = '10.0.2.2:8000';
    Client client = Client();
    try {
      var value =
      await client.post('http://$theUrl/panel/api/v1/Supplier/', headers: {
        'Authorization': 'Basic Vl93ck1wVC5rKjVlMiZVLjo+fkF1bVA/TU4zYmdzTllF',
      }, body: {
        'name': this.name,
        'mobile': this.mobile,
        'password': this.password
      });
      final response = json.decode(utf8.decode(value.bodyBytes));
      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
  }

  Future<List<dynamic>> doSupplierLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theUrl = '10.0.2.2:8000';
    Client client = Client();
    try {
      var response =
      await client.get('http://$theUrl/panel/api/v1/Supplier/', headers: {
        'Authorization': 'Basic Vl93ck1wVC5rKjVlMiZVLjo+fkF1bVA/TU4zYmdzTllF',
      });
      final suppliers = json.decode(utf8.decode(response.bodyBytes));
      return suppliers;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
  }
}
