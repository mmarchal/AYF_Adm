import 'package:ayf_admin/models/token.dart';

class ApiResponse {

  int status;
  String message;
  Token result;

  ApiResponse(this.status, this.message, this.result);

  ApiResponse.fromJson(Map<String, dynamic> json) :
      status = json['status'],
      message = json['message'],
      result = Token.fromJson(json['result']);

}