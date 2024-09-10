import 'package:flutter/material.dart';

class  SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker application",
      home: Material(
        color: const Color(0xffb2d4be),
        child: LayoutBuilder(builder: (context,parent)
        {
          return  Center(
            child: SizedBox(
                height: parent.maxHeight /2,
                child: Image.asset('images/money_tracker.png', fit: BoxFit.fitHeight,)
            ),
          );
        }
        ),
      ),
    );
  }
}