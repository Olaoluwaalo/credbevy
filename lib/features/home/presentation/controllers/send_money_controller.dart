// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:credbevy/common/generic_dialog.dart';
import 'package:credbevy/features/home/data/models/beneficiaries.dart';
import 'package:credbevy/features/home/data/services/api_services.dart';
import 'package:flutter/material.dart';

class SendMoneyController with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  // init State
  initializedData(BuildContext context) async {
    getAccountBalance(context);
    getAllBeneficiaries(context);
  }

  // Balance related
  double? balanced;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> getAccountBalance(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final balanceData = await _apiServices.getAllBalance(context);
      if (balanceData != null) {
        balanced = balanceData.data;
        log(balanced.toString());
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

// Beneficiaries related
  List<Beneficiary> _beneficials = [];
  List<Beneficiary> get beneficials => _beneficials;

  Future<void> getAllBeneficiaries(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final beneficiariesData = await _apiServices.getAllBeneficiaries(context);
      if (beneficiariesData != null) {
        _beneficials = beneficiariesData.data;
        log(_beneficials[0].fullname);
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

  Future<void> sendMoney({
    required BuildContext context,
    required double amount,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _apiServices.transferTo(context, 1, amount);
      _isLoading = false;
      genericDialog(context: context, contentText: "Money Successfully sent");
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      genericDialog(context: context, contentText: e.toString());
    }
  }
}
