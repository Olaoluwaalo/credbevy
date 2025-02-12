// To parse this JSON data, do
//
//     final beneficiaries = beneficiariesFromJson(jsonString);

import 'dart:convert';

Beneficiaries beneficiariesFromJson(String str) => Beneficiaries.fromJson(json.decode(str));

String beneficiariesToJson(Beneficiaries data) => json.encode(data.toJson());

class Beneficiaries {
    bool error;
    String message;
    List<Beneficiary> data;

    Beneficiaries({
        required this.error,
        required this.message,
        required this.data,
    });

    factory Beneficiaries.fromJson(Map<String, dynamic> json) => Beneficiaries(
        error: json["error"],
        message: json["message"],
        data: List<Beneficiary>.from(json["data"].map((x) => Beneficiary.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Beneficiary {
    int id;
    String fullname;
    String image;

    Beneficiary({
        required this.id,
        required this.fullname,
        required this.image,
    });

    factory Beneficiary.fromJson(Map<String, dynamic> json) => Beneficiary(
        id: json["id"],
        fullname: json["fullname"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "image": image,
    };
}
