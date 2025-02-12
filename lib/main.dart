import 'package:credbevy/app.dart';
import 'package:credbevy/features/home/presentation/controllers/home_controller.dart';
import 'package:credbevy/features/home/presentation/controllers/send_money_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeController(),
      ),
     ChangeNotifierProvider(
        create: (context) => SendMoneyController(),
      ),
    ],
    child: const CApp(),
  ));
}

