
import 'package:fleetapp/models/get_fleet_response.dart';
import 'package:fleetapp/models/auth_response.dart';
import 'package:fleetapp/models/basic_response.dart';
import 'package:http/http.dart' as http;

import 'ApiUrl.dart';

class ApiService {


  Future<BasicResponse> generateOtp(String phoneNumber) async {
    try {
      var url = Uri.parse(ApiUrl.baseUrl + ApiUrl.generateOtpUri);
      String body = "username=$phoneNumber";
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        BasicResponse _model = basicResponseFromJson(response.body);
        return _model;
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future<AuthResponse> authenticate(String phoneNumber, String otp) async {
    try {
      String body = "username=$phoneNumber&password=$otp";
      var url = Uri.parse(ApiUrl.baseUrl + ApiUrl.authenticateUri);
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        AuthResponse _model = authResponseFromJson(response.body);
        return _model;
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future<GetFleetResponse> getFleet(String fleetId) async {
    try {
      var url = Uri.parse("${ApiUrl.baseUrl}${ApiUrl.getFleetUri}/$fleetId");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        GetFleetResponse _model = getFleetResponseFromJson(response.body);
        return _model;
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}