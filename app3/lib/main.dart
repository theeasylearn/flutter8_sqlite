import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter/rendering.dart';
// import 'app_splash.dart';
// import 'app_view_expense.dart';
// import 'simple_interest_calc.dart';
// import 'package:intl/intl.dart';
import 'app_view_expense.dart';
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


