import 'dart:convert';
import 'package:ayf_admin/models/ApiResponse.dart';
import 'package:http/http.dart' as http;

const urlServeur = "http://appliraspberry.ddns.net:8181";

class Api {

  static Future getToken() async {
    var url = urlServeur + "/token";
    Map data = {
      "password": "marchal",
      "username": "maxime"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    var apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
    return apiResponse;
  }


}