import 'package:app3/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'app_view_expense.dart';

class EditExistingTransaction extends StatelessWidget {

  String entryId ='';
  EditExistingTransaction(String entryId)
  {
      this.entryId = entryId;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Income/Expense app",
      home: EditTransaction(entryId),
    );
  }
}

class EditTransaction extends StatefulWidget {

  String entryId = '';
  EditTransaction(String entryId)
  {
    this.entryId = entryId;
  }

  @override
  State<EditTransaction> createState() {
    _EditTransactionState e1 = _EditTransactionState(entryId);
    return e1;
  }
}

class _EditTransactionState extends State<EditTransaction> {
  var dateController = TextEditingController();
  //create controller for each and every textfield
  var titleController = new TextEditingController();
  var amountController = new TextEditingController();
  var detailController = new TextEditingController();

  String Title="",Amount="",Detail="";
  String SelectedValue = '1';

  String entryId = '';
  Database? db; //variable
  DBHelper? mydatabase = DBHelper();

  var table;

  String date =''; //object

  _EditTransactionState(String entryId)
  {
    this.entryId = entryId;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEntry();

    titleController.addListener(() {
      if(titleController.text.isNotEmpty == true)   Title = titleController.text;
    });

    amountController.addListener(() {
      if(amountController.text.isNotEmpty == true)   Amount = amountController.text;
    });

    detailController.addListener(() {
      if(detailController.text.isNotEmpty == true)   Detail = detailController.text;
    });


  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Entry"),
      ),
      body: Material(
        color: const Color(0xffb2d4be),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: LayoutBuilder(builder: (ctx, parent) {
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
                            "Edit Entry",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: "sfpro",
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: titleController,
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
                          controller: amountController,
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

                            print("we have clicked inside datepicker");
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
                                date = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        TextField(
                          controller: detailController,
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
                            onPressed: ()  async {
                              String sql = "update " + DBHelper.TABLE_TRANSACTION +
                                  " set title='$Title',detail='$Detail',"
                                  "amount=$Amount,date='$date',flag=$SelectedValue where _id=$entryId";
                              print(sql);
                              int response = await mydatabase!.RunQuery(sql);
                              if(response == DBHelper.SUCCESS)
                              {
                                Get.snackbar("Success", "Entry edited successfully", snackPosition: SnackPosition.BOTTOM);
                                Get.to(ViewExpense());

                              }
                              else
                              {
                                Get.snackbar("error", "Entry could not be edited", snackPosition: SnackPosition.BOTTOM);
                              }
                            },
                            child: const Text("Save Changes"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Future<void> fetchEntry() async {
    String sql = "select * from " + DBHelper.TABLE_TRANSACTION + " where _id=" + entryId;
    db = await mydatabase!.db;
    table = await mydatabase!.FetchDataFromTable(sql);
    print(table);
    print('----------------');
    titleController.text = table[0]['title'];
    detailController.text = table[0]['detail'];
    dateController.text = table[0]['date'];
    amountController.text = table[0]['amount'].toString();

    setState(() {
        SelectedValue = table[0]['flag'].toString();
        date = table[0]['date'];
    });
  }
}