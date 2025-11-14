import 'package:expensetracker/screens/homescreen.dart';
import 'package:expensetracker/widgets/addTransactioncard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditExpense extends StatefulWidget {
  const EditExpense({super.key});

  @override
  State<EditExpense> createState() => _EditExpenseState();
}

class _EditExpenseState extends State<EditExpense> {
 
 TextEditingController title=TextEditingController();
  TextEditingController amount=TextEditingController();
   TextEditingController category=TextEditingController();
    TextEditingController date=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
          },
          child: Icon(Icons.arrow_back, size: 20)),
        centerTitle: true,
        title: Text(
          "Edit Transaction",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),

      body:  Addtransactioncard(
                title: title,
                amount: amount, 
                category: category, 
                date:  date, 
                onpressedin: () { 
                  print("Hello");
                 }, 
                textButton: 'Edit',),
    );
  }
}
