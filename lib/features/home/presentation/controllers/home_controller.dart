// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:credbevy/common/generic_dialog.dart';
import 'package:credbevy/features/home/data/models/credit_cards.dart';
import 'package:credbevy/features/home/data/models/expenses.dart';
import 'package:credbevy/features/home/data/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  // init State
  initializedData(BuildContext context) async {
    await getCreditCards(context);
    await getExpenses(context);
  }

  // card related
  List<CreditCard> _creditCards = [];
  List<CreditCard> get creditCards => _creditCards;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> getCreditCards(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final creditCardsData = await _apiServices.getCreditCard(context);
      if (creditCardsData != null) {
        _creditCards = creditCardsData.data;
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        genericDialog(
            context: context,
            contentText: "No data returned for credit cards.");
      }
    } catch (error) {
      genericDialog(context: context, contentText: error.toString());
    }
  }

// Expenses related
  List<Expense> _expenses = [];
  List<Expense> get expenses => _expenses;

  Future<void> getExpenses(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final expensesData = await _apiServices.getExpenses(context);
      if (expensesData != null) {
        _expenses = expensesData.data;
        
  
        log(_expenses[0].amountSpent.toString());
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        genericDialog(
            context: context,
            contentText: "No data returned for credit cards.");
      }
    } catch (error) {
      genericDialog(context: context, contentText: error.toString());
    }
  }
}
