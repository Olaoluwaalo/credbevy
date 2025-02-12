// To parse this JSON data, do
//
//     final transferResponse = transferResponseFromJson(jsonString);

import 'dart:convert';

TransferResponse transferResponseFromJson(String str) => TransferResponse.fromJson(json.decode(str));

String transferResponseToJson(TransferResponse data) => json.encode(data.toJson());

class TransferResponse {
    bool error;
    String message;
    Transaction transaction;

    TransferResponse({
        required this.error,
        required this.message,
        required this.transaction,
    });

    factory TransferResponse.fromJson(Map<String, dynamic> json) => TransferResponse(
        error: json["error"],
        message: json["message"],
        transaction: Transaction.fromJson(json["transaction"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "transaction": transaction.toJson(),
    };
}

class Transaction {
    Receiver sender;
    Receiver receiver;
    int amount;

    Transaction({
        required this.sender,
        required this.receiver,
        required this.amount,
    });

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        sender: Receiver.fromJson(json["sender"]),
        receiver: Receiver.fromJson(json["receiver"]),
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "sender": sender.toJson(),
        "receiver": receiver.toJson(),
        "amount": amount,
    };
}

class Receiver {
    int id;
    String fullname;

    Receiver({
        required this.id,
        required this.fullname,
    });

    factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
        id: json["id"],
        fullname: json["fullname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
    };
}
