import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutBuilderExample1());
}
class LayoutBuilderExample1 extends StatelessWidget {
  const LayoutBuilderExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Layout builder example",
      home: Scaffold(
        appBar: AppBar(title: const Text("Dashboard"),),
        body: LayoutBuilder(
          builder: (context,parent) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/store.png",fit: BoxFit.fill,),
                                ),
                              ),
                              const Text("Shop",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/cart.png",fit: BoxFit.fill,),
                                ),
                              ),
                              const Text("cart",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/heart.png",fit: BoxFit.fill,),
                                ),
                              ),
                              const Text("Wishlist",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/history.png",fit: BoxFit.fill,),
                                ),
                              ),
                              const Text("History",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/settings.png",fit: BoxFit.fill,),
                                ),
                              ),
                              const Text("Change Password",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      height: parent.maxHeight /3,
                      width: parent.maxWidth /2,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: LayoutBuilder(
                        builder: (ctx,parent) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                                child: SizedBox(
                                  height: parent.maxHeight * 0.85,
                                  child:  Image.asset("images/logout.png",fit: BoxFit.fill,),
                                ),
                              ),
                              const Text("Logout",textAlign: TextAlign.center,style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
