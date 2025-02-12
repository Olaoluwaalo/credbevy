// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:credbevy/Repositories/network_services.dart';
import 'package:credbevy/common/generic_dialog.dart';
import 'package:credbevy/core/constants/api_constants.dart';
import 'package:credbevy/features/home/data/models/balance.dart';
import 'package:credbevy/features/home/data/models/beneficiaries.dart';
import 'package:credbevy/features/home/data/models/credit_cards.dart';
import 'package:credbevy/features/home/data/models/expenses.dart';
import 'package:credbevy/features/home/data/models/transfer_response.dart';
import 'package:flutter/material.dart';

class ApiServices {
  final _networkService = NetworkService();
  Future<CreditCards?> getCreditCard(BuildContext context) async {
    try {
      final creditCards = await _networkService.get(allCreditCards, (json) {
        return CreditCards.fromJson(json);
      });
      return creditCards;
    } catch (e) {
      genericDialog(context: context, contentText: e.toString());
      return null;
    }
  }

  Future<Expenses?> getExpenses(BuildContext context) async {
    try {
      final ex = await _networkService.get(myexpenses, (json) {
        final ex = Expenses.fromJson(json);
        log(ex.message);
        return Expenses.fromJson(json);
      });
      return ex;
    } catch (e) {
      genericDialog(context: context, contentText: e.toString());

      return null;
    }
  }

  Future<Beneficiaries?> getAllBeneficiaries(BuildContext context) async {
    try {
      final beneficials = await _networkService.get(beneficiaries, (json) {
        final ex = Beneficiaries.fromJson(json);
        log(ex.data[0].fullname);
        return Beneficiaries.fromJson(json);
      });
      return beneficials;
    } catch (e) {
      genericDialog(context: context, contentText: e.toString());
      
    return null;
    }
  }

  Future<Balance?> getAllBalance(BuildContext context) async {
    try {
      final bal = await _networkService.get(balance, (json) {
        final ex = Balance.fromJson(json);
        log(ex.message);
        return Balance.fromJson(json);
      });
      return bal;
    } catch (e) {
      genericDialog(context: context, contentText: e.toString());

      return null;
    }
  }

  Future<TransferResponse?> transferTo(
    BuildContext context,
    double receiverId,
    double amount,
  ) async {
    try {
      await _networkService.post(transfer, (json) {
        final ex = TransferResponse.fromJson(json);
        log(ex.transaction.amount.toString());
        return TransferResponse.fromJson(json);
      }, body: {
        "receiver_id": receiverId,
        "amount": amount,
      });
    } catch (e) {
      genericDialog(context: context, contentText: e.toString());
    }
    return null;
  }
}
