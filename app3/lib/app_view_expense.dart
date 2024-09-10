import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'add_trandaction.dart';
import 'db_helper.dart';

class ViewExpense extends StatelessWidget {


  Database? db; //variable
  DBHelper? mydatabase = new DBHelper(); //object

  @override
  void initstate()
  {
      initlizeDatabase();
      String sql = "select * from " +  DBHelper.TABLE_TRANSACTION + " order by _id desc";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("floating action button clicked");
          Get.to(() => AddNewTransaction());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
      body: Material(
        color: const Color(0xffb2d4be),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("View Income/Expense"),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Book Expense",
                            style: TextStyle(fontFamily: "sfpro"),
                          ),
                          Text(
                            "100",
                            style: TextStyle(
                                fontFamily: "sfpro",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Maths book sem 5"),
                          Row(
                            children: [
                              Image.asset("images/edit.png"),
                              Image.asset("images/delete.png"),
                            ],
                          )
                        ],
                      ),
                      leading: Image.asset('images/income.png'),
                    ),
                  ),
                );
              }, childCount: 24),
            )
          ],
        ),
      ),
    );
  }

  Future<void> initlizeDatabase() async {
    db = await mydatabase!.db;
  }
}
