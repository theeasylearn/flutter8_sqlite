import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/rendering.dart';
import 'add_trandaction.dart';
// import 'app_splash.dart';
// import 'app_view_expense.dart';
// import 'simple_interest_calc.dart';
// import 'package:intl/intl.dart';
import 'app_view_expense.dart';
import 'register_pin.dart';
import 'login_pin.dart';
void main() {
  runApp(
    GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Welcome to application'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 22,
          ),
        ),
        body: ViewExpense(),
      ),
    ),
  );
}
