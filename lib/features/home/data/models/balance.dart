// To parse this JSON data, do
//
//     final balance = balanceFromJson(jsonString);

import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
    bool error;
    String message;
    double data;

    Balance({
        required this.error,
        required this.message,
        required this.data,
    });

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        error: json["error"],
        message: json["message"],
        data: json["data"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": data,
    };
}
