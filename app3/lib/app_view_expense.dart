import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'add_trandaction.dart';
import 'db_helper.dart';

class ViewExpense extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    ViewExpenseState ves1 = new ViewExpenseState();
    return ves1;
  }

}
class ViewExpenseState extends State<ViewExpense>
{
  Database? db; //variable
  DBHelper? mydatabase = new DBHelper(); //object
  var table;
  var entries = []; //create empty list
  @override
  void initState()
  {
    super.initState();
    print("before fetch");
    fetchTable();
    print("after fetch");

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
        color: Color(0xffb2d4be),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("View Income/Expense"),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            entries[index]['title'].toString() + "[" + entries[index]['date'].toString() + "]",
                            style: TextStyle(fontFamily: "sfpro"),
                          ),
                          Text(
                            entries[index]['amount'].toString(),
                            style: TextStyle(
                                fontFamily: "sfpro",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text( entries[index]['detail'].toString(),),
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
              }, childCount: entries.length),
            )
          ],
        ),
      ),
    );
  }

  Future<void> fetchTable() async {
    print("before fetch sql statement run");
    db = await mydatabase!.db;
    String sql = "select * from " +  DBHelper.TABLE_TRANSACTION + " order by _id desc";
    table = await mydatabase!.FetchDataFromTable(sql);
    print(table);
    //store table into empty list
    setState(() {
        entries = table;
    });
  }
}
