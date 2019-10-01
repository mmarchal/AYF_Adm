import 'dart:convert';
import 'dart:io';
import 'package:ayf_admin/models/ApiResponse.dart';
import 'package:ayf_admin/models/pronostic.dart';
import 'package:http/http.dart' as http;

const urlServeur = "http://appliraspberry.ddns.net:8585";

class Api {

  static Future sendDatas(Pronostic p) async {
    var url = urlServeur + "/token";
    Map data = {
      "password": "marchal",
      "username": "marchal.maxime@live.fr"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    var apiResponse = ApiResponse.fromJson(jsonDecode(response.body));

    var send = urlServeur + "/pronostic/add";
    return http.post(send, headers: {
      HttpHeaders.authorizationHeader : "Bearer ${apiResponse.result.token}",
      HttpHeaders.contentTypeHeader: 'application/json',
    }, body: json.encode(p.toJson()));
    
  }


}