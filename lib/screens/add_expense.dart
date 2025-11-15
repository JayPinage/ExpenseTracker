import 'package:expensetracker/provider/expenseProvider.dart';
import 'package:expensetracker/widgets/addTransactioncard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AddExpense extends ConsumerStatefulWidget {
  const AddExpense({super.key});

  @override
  ConsumerState<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends ConsumerState<AddExpense> {
  TextEditingController title = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 20),
        ),
        centerTitle: true,
        title: Text("Add Transaction",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ),

      body: Addtransactioncard(
        title: title,
        amount: amount,
        category: category,
        date: date,

        onpressedin: () {
          // *************** VALIDATION ***************
          if (title.text.isEmpty ||
              amount.text.isEmpty ||
              category.text.isEmpty ||
              date.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Please fill all fields")),
            );
            return;
          }

          // PARSE amount safely
          double? amountValue = double.tryParse(amount.text);
          if (amountValue == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Enter a valid amount")),
            );
            return;
          }

          // PARSE date safely
          late DateTime parsedDate;
          try {
            parsedDate = DateFormat("dd/MM/yyyy").parse(date.text);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Invalid date format")),
            );
            return;
          }

          // *************** SAVE TO PROVIDER ***************
          ref.read(expenseProvider.notifier).addExpense(
                title.text,
                amountValue,
                category.text,
                parsedDate,
              );

          Navigator.pop(context);
        },

        textButton: 'Save',
      ),
    );
  }
}
