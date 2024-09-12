import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_example/webview_example_1.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
void main() {
  runApp(PrivacyPolicy());
}

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  late WebViewController myController;
  String WebSite = "https://doc-hosting.flycricket.io/com-theeasylearn-flutter8-privacy-policy/608df3f3-6301-441b-a20b-d9a08cb82e0c/privacy";
  FlutterSecureStorage storage = FlutterSecureStorage();
  var log = Logger();
  @override
  void initState() {
    super.initState();
    log.d("initstate method is called ");
    myController = WebViewController()..loadRequest(Uri.parse(WebSite));
    checkPrivacyPolicyUserDecision();

  }

  @override
  Widget build(BuildContext context) {
    log.d("build method is called");
    log.e("it is kind of error message");
    log.w("it is kind of warning message");
    log.i("it is kind of info message");
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Webview Example"),
        ),
        body: LayoutBuilder(builder: (BuildContext context, BoxConstraints parent) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: parent.maxHeight * 0.85,
                child: WillPopScope(
                  onWillPop: () => shouldICloseApp(context),
                  child: WebViewWidget(controller: myController),
                ),
              ),
              SizedBox(
                height: parent.maxHeight * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: parent.maxWidth / 2,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        onPressed: () async {
                          await storage.write(key: "privacy_policy", value: "accepted");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewExample()));
                        },
                        child: const Text(
                          "Accept",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: parent.maxWidth / 2,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                        ),
                        onPressed: () {
                          storage.write(key: "privacy_policy", value: "rejected");
                        },
                        child: const Text(
                          "Decline",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Future<bool> shouldICloseApp(BuildContext context) async {
    if (await myController.canGoBack()) {
      myController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  void checkPrivacyPolicyUserDecision()  {
    log.d("Check Privacy policy .....");

    storage.read(key: 'privacy_policy').then((decision) {
      log.d('decision = '+ decision.toString());
      if (decision == 'accepted') {
        log.d("Privacy policy already accepted.");

        Get.to(() => WebViewExample());
      } else {
        log.d("Showing privacy policy.");
        Get.snackbar("Attention", "You have not yet accepted the privacy policy.");
      }
    });

  }
}
