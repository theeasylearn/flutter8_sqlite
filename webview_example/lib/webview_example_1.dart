import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(WebViewExample());
}
class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late WebViewController myController;
  String WebSite = "https://pub.dev/";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController = WebViewController()..loadRequest(Uri.parse(WebSite));

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Webview Example"),
        ),
        body: WillPopScope(
            onWillPop: () => shouldICloseApp(context),
            child: WebViewWidget(
                controller: myController)),
      ),
    );
  }

  Future<bool> shouldICloseApp(BuildContext context) async {
    if(await myController.canGoBack() == true)
    {
      //it means webview has previous page that should be displayed to user when
      //he press back button
      myController.goBack(); //display previous page
      return Future.value(false);
    }
    else
    {
      return Future.value(true);
    }
  }
}
//https://doc-hosting.flycricket.io/com-theeasylearn-flutter8-privacy-policy/608df3f3-6301-441b-a20b-d9a08cb82e0c/privacy
//https://doc-hosting.flycricket.io/com-theeasylearn-flutter8-terms-of-use/44da3dcf-a72a-4d8c-ade6-6ecc4b43ac66/terms
