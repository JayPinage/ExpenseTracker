import 'package:expensetracker/screens/homescreen.dart';
import 'package:expensetracker/widgets/addTransactioncard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
 
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
          "Add Transaction",
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
                textButton: 'Save',),
    );
  }
}
