// To parse this JSON data, do
//
//     final expenses = expensesFromJson(jsonString);

import 'dart:convert';

Expenses expensesFromJson(String str) => Expenses.fromJson(json.decode(str));

String expensesToJson(Expenses data) => json.encode(data.toJson());

class Expenses {
    bool error;
    String message;
    List<Expense> data;

    Expenses({
        required this.error,
        required this.message,
        required this.data,
    });

    factory Expenses.fromJson(Map<String, dynamic> json) => Expenses(
        error: json["error"],
        message: json["message"],
        data: List<Expense>.from(json["data"].map((x) => Expense.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Expense {
    String month;
    int amountSpent;

    Expense({
        required this.month,
        required this.amountSpent,
    });

    factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        month: json["month"],
        amountSpent: json["amount_spent"],
    );

    Map<String, dynamic> toJson() => {
        "month": month,
        "amount_spent": amountSpent,
    };
}
