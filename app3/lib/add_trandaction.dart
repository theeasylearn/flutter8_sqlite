import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'app_view_expense.dart';
import 'db_helper.dart';
import 'package:get/get.dart';
import 'dart:async';

class AddNewTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Entry"),
      ),
      body: AddTransaction(),
    );
  }
}

class AddTransaction extends StatefulWidget {
  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController dateController = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController detailcontroller = TextEditingController();
  String title = '', amount = '', detail = '', date = '';
  Database? db;

  String SelectedValue = '1';
  DBHelper mydatabase = DBHelper();

  Future<void> createDatabase() async {
    print("before creating database");
    db = await mydatabase.db;
    print("after creating database");
  }

  @override
  void initState() {
    super.initState();
    createDatabase();

    titlecontroller.addListener(() {
      if (titlecontroller.text.isNotEmpty) title = titlecontroller.text;
    });

    detailcontroller.addListener(() {
      if (detailcontroller.text.isNotEmpty) detail = detailcontroller.text;
    });

    amountcontroller.addListener(() {
      if (amountcontroller.text.isNotEmpty) amount = amountcontroller.text;
    });

    dateController.addListener(() {
      if (dateController.text.isNotEmpty) date = dateController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffb2d4be),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: LayoutBuilder(
          builder: (ctx, parent) {
            return SizedBox(
              height: parent.maxHeight,
              child: SingleChildScrollView(
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FittedBox(
                          child: Text(
                            "Add Entry",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: "sfpro",
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        TextField(
                          controller: titlecontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Title",
                            fillColor: Color(0x75ffffff),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        TextField(
                          controller: amountcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Amount",
                            fillColor: Color(0x75ffffff),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        TextField(
                          controller: dateController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: "Enter Date",
                          ),
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());

                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null) {
                              String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                              setState(() {
                                dateController.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        TextField(
                          controller: detailcontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Details",
                            fillColor: Color(0x75ffffff),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        const Text("Mode of entry"),
                        ListTile(
                          title: const Text('Income'),
                          leading: Radio(
                            value: '2',
                            groupValue: SelectedValue,
                            onChanged: (value) {
                              setState(() {
                                SelectedValue = value.toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Expense'),
                          leading: Radio(
                            value: '1',
                            groupValue: SelectedValue,
                            onChanged: (value) {
                              setState(() {
                                SelectedValue = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: parent.maxWidth,
                          child: ElevatedButton(
                            onPressed: () async {
                              String sql = "insert into " +
                                  DBHelper.TABLE_TRANSACTION +
                                  " (title,detail,amount,date,flag) " +
                                  " values ('$title','$detail',$amount,'$date',$SelectedValue)";
                              int response = await mydatabase.RunQuery(sql);
                              if (response == DBHelper.SUCCESS) {
                                print("row inserted successfully");
                                Get.snackbar("Success", "Entry added successfully", snackPosition: SnackPosition.BOTTOM);
                              } else {
                                print("error in inserting row");
                                Get.snackbar("error", "Entry could not be added", snackPosition: SnackPosition.BOTTOM);
                              }
                              await Future.delayed(Duration(seconds: 2));
                              Get.to(ViewExpense());
                            },
                            child: const Text("Add Entry"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
