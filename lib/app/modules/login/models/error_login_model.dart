import 'package:meta/meta.dart';
import 'dart:convert';

ErrorLoginModel errorLoginModelFromJson(String str) => ErrorLoginModel.fromJson(json.decode(str));

String errorLoginModelToJson(ErrorLoginModel data) => json.encode(data.toJson());

class ErrorLoginModel {
  ErrorLoginModel({
    required this.mode,
    required this.exception,
    required this.data,
    required this.message,
    required this.status,
  });

  String mode;
  String exception;
  List<dynamic> data;
  String message;
  int status;

  factory ErrorLoginModel.fromJson(Map<String, dynamic> json) => ErrorLoginModel(
    mode: json["mode"],
    exception: json["exception"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "exception": exception,
    "data": List<dynamic>.from(data.map((x) => x)),
    "message": message,
    "status": status,
  };
}
