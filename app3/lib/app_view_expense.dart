import 'package:app3/register_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'add_trandaction.dart';
import 'db_helper.dart';
import 'edit_transaction.dart';
import 'login_pin.dart';

class ViewExpense extends StatefulWidget {
  const ViewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    ViewExpenseState ves1 = ViewExpenseState();
    return ves1;
  }
}

class ViewExpenseState extends State<ViewExpense> {
  Database? db; //variable
  DBHelper? mydatabase = DBHelper(); //object
  var table;
  var entries = []; //create empty list
  @override
  void initState() {
    super.initState();
    DetectLoginRegisterActivity();
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
          Get.to(() => const AddNewTransaction());
        },
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.add),
      ),
      body: Material(
        color: const Color(0xffb2d4be),
        child: displayView(),
      ),
    );
  }

  Future<void> fetchTable() async {
    print("before fetch sql statement run");
    db = await mydatabase!.db;
    String sql =
        "select * from ${DBHelper.TABLE_TRANSACTION} order by _id desc";
    table = await mydatabase!.FetchDataFromTable(sql);
    print(table);
    //store table into empty list
    setState(() {
      entries = table;
    });
  }

  Widget showMyIcon(int flag) {
    if (flag == 2) {
      return Image.asset('images/income.png');
    } else {
      return Image.asset('images/expense.png');
    }
  }

  displayDetail(detail) {
    if (detail.length < 25) {
      return detail.toString();
    } else {
      return "${detail.toString().substring(0, 25)}...";
    }
  }

  Widget displayView() {
    if (entries.length > 0) {
      return (CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("View Income/Expense"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          entries[index]['title'].toString(),
                          style: const TextStyle(fontFamily: "sfpro"),
                        ),
                        Text(
                          entries[index]['amount'].toString(),
                          style: const TextStyle(
                              fontFamily: "sfpro", fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date :- ${entries[index]['date']}',
                            style: const TextStyle(fontFamily: "sfpro")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child:
                                  Text(displayDetail(entries[index]['detail'])),
                              onTap: () {
                                Get.snackbar("detail",
                                    entries[index]['detail'].toString(),
                                    snackPosition: SnackPosition.BOTTOM);
                              },
                            ),
                            Row(
                              children: [
                                InkWell(
                                  child: Image.asset("images/edit.png"),
                                  onTap: () {
                                    Get.to(EditExistingTransaction(
                                        entries[index]['_id'].toString()));
                                  },
                                ),
                                InkWell(
                                  child: Image.asset("images/delete.png"),
                                  onTap: () async {
                                    // Store the ID of the item to be deleted
                                    var entryId = entries[index]['_id'];

                                    String sql =
                                        "delete from ${DBHelper.TABLE_TRANSACTION} where _id=$entryId";
                                    int response =
                                        await mydatabase!.RunQuery(sql);

                                    if (response == DBHelper.SUCCESS) {
                                      setState(() {
                                        // Convert entries to a mutable list if it's not already
                                        entries = List.from(entries);

                                        // Remove the item with the matching ID from the list
                                        entries.removeWhere(
                                            (item) => item['_id'] == entryId);
                                      });
                                      Get.snackbar("Success",
                                          "Entry deleted successfully",
                                          snackPosition: SnackPosition.BOTTOM);
                                    } else {
                                      Get.snackbar(
                                          "Error", "Entry could not be deleted",
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    leading: showMyIcon(entries[index]['flag']),
                  ),
                ),
              );
            }, childCount: entries.length),
          )
        ],
      ));
    } else {
      return Center(
        child: Image.asset('images/empty.png'),
      );
    }
  }

  Future<void> DetectLoginRegisterActivity() async {
    FlutterSecureStorage storage = new FlutterSecureStorage();
    storage.read(key: 'otp').then((otp) {
       if(otp==null)
       {
          Get.to(new RegisterPin());
       }
       else
       {
         storage.read(key: 'login').then((login){
            if(login != null && login != 'yes')
              Get.to(new LoginPin());
            else if(login==null)
              Get.to(new LoginPin());
         });

       }
    });
  }
}
