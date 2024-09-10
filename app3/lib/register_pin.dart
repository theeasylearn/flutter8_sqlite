import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class RegisterPin extends StatefulWidget {
  const RegisterPin({Key? key}) : super(key: key);

  @override
  State<RegisterPin> createState() => _RegisterPinState();
}

class _RegisterPinState extends State<RegisterPin> {
  late final TextEditingController pinController, confirmPinController;
  late final FocusNode focusNode,focusNode2;
  String pin1 = '', pin2 = '';
  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    confirmPinController = TextEditingController();
    focusNode = FocusNode();
    focusNode2 = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    confirmPinController.dispose();
    focusNode.dispose();
    focusNode2.dispose();
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Create new pin",
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
          const Text(
            "confirm new pin",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Pinput(
            // You can pass your own SmsRetriever implementation based on any package
            // in this example we are using the SmartAuth
            controller: confirmPinController,
            focusNode: focusNode2,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
              pin2 = pin;
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
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
                onPressed: () {
                  print("new pin $pin1");
                  print("confirm new pin $pin2");
                  if (pin1 == pin2) {
                    print("both pin are same");
                  } else {
                    print("both pin are not same");
                  }
                },
                child: const Text("set pin")),
          )
        ],
      ),
    );
  }
}
