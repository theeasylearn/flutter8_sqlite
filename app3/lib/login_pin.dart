import 'package:app3/register_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';

import 'app_view_expense.dart';
class LoginPin extends StatefulWidget {
  const LoginPin({Key? key}) : super(key: key);

  @override
  State<LoginPin> createState() => _LoginPinState();
}

class _LoginPinState extends State<LoginPin> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  String pin1 = '';

  //create object FlutterSecureStorage
  FlutterSecureStorage storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(0, 0, 255, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(0, 0, 0, 1);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(255, 0, 0, 1),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login pin",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          Pinput(
            // You can pass your own SmsRetriever implementation based on any package
            // in this example we are using the SmartAuth
            controller: pinController,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
              pin1 = pin;
      
              //logic to compare user given pin along with pin inside storage
      
              //get pin from storage
              storage.read(key: 'otp').then((result){
                  //result variable has pin read from storage. if not found it is null
                  if(result==null)
                  {
                    Get.to(new RegisterPin());
                  }
                  else
                  {
                     if(result == pin1)
                     {
                       //create another secure storage variable to store login status
                       storage.write(key:"login",value: "yes");
                       Get.to(new ViewExpense());
                     }
                     else
                     {
                       Get.snackbar("Invalid Pin","you have entered wrong pin",snackPosition: SnackPosition.BOTTOM);
                     }
                  }
              });
            },
            onChanged: (value) {
              debugPrint('onChanged: $value');
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: focusedBorderColor,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: fillColor,
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
        ],
      ),
    );
  }
}
