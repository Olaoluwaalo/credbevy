// To parse this JSON data, do
//
//     final creditCards = creditCardsFromJson(jsonString);

import 'dart:convert';

CreditCards creditCardsFromJson(String str) => CreditCards.fromJson(json.decode(str));

String creditCardsToJson(CreditCards data) => json.encode(data.toJson());

class CreditCards {
    bool error;
    String message;
    List<CreditCard> data;

    CreditCards({
        required this.error,
        required this.message,
        required this.data,
    });

    factory CreditCards.fromJson(Map<String, dynamic> json) => CreditCards(
        error: json["error"],
        message: json["message"],
        data: List<CreditCard>.from(json["data"].map((x) => CreditCard.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CreditCard {
    int id;
    String cardNumber;
    String cardType;
    int balance;
    String name;
    String bankName;
    String expiryDate;

    CreditCard({
        required this.id,
        required this.cardNumber,
        required this.cardType,
        required this.balance,
        required this.name,
        required this.bankName,
        required this.expiryDate,
    });

    factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        id: json["id"],
        cardNumber: json["card_number"],
        cardType: json["card_type"],
        balance: json["balance"],
        name: json["name"],
        bankName: json["bank_name"],
        expiryDate: json["expiry_date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "card_number": cardNumber,
        "card_type": cardType,
        "balance": balance,
        "name": name,
        "bank_name": bankName,
        "expiry_date": expiryDate,
    };
}
