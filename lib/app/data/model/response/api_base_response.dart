import 'package:dio/dio.dart';

class ApiBaseResponse {
  bool? success;
  int? resultCode;
  String? message;
  dynamic data;

  Response? dioResponse;

  ApiBaseResponse({this.success, this.resultCode, this.message, this.data});

  ApiBaseResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    resultCode = json['result_code'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['result_code'] = resultCode;
    data['message'] = message;
    data['data'] = this.data!.toJson();

    return data;
  }
}
