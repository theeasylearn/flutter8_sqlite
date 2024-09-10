import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditExistingTransaction extends StatelessWidget {
  const EditExistingTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Income/Expense app",
      home: EditTransaction(),
    );
  }
}

class EditTransaction extends StatefulWidget {
  const EditTransaction({super.key});


  @override
  State<EditTransaction> createState() {
    _EditTransactionState e1 = _EditTransactionState();
    return e1;
  }
}

class _EditTransactionState extends State<EditTransaction> {
  TextEditingController dateController = TextEditingController();
  String SelectedValue = '1';
  @override
  Widget build(BuildContext context) {
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
                        const TextField(

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
                        const TextField(
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
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        const TextField(
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
                            onPressed: () {
                              setState(() {
                                // Your action here

                              });
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
}