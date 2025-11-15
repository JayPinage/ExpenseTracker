import 'package:expensetracker/provider/expenseProvider.dart';
import 'package:expensetracker/widgets/addTransactioncard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../model/expenseModel.dart';

class EditExpense extends ConsumerStatefulWidget {
  final int id;
  const EditExpense({super.key, required this.id});

  @override
  ConsumerState<EditExpense> createState() => _EditExpenseState();
}

class _EditExpenseState extends ConsumerState<EditExpense> {
  final title = TextEditingController();
  final amount = TextEditingController();
  final category = TextEditingController();
  final date = TextEditingController();

  ExpenseModel? expense;

  @override
  void initState() {
    super.initState();

    // 🔥 Load initial data only ONCE
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final list = ref.read(expenseProvider);
      expense = list.firstWhere((e) => e.id == widget.id);

      title.text = expense!.title;
      amount.text = expense!.amount.toString();
      category.text = expense!.category;
      date.text = DateFormat("dd/MM/yyyy").format(expense!.date);

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Transaction"),
      ),

      body: Addtransactioncard(
        title: title,
        amount: amount,
        category: category,
        date: date,
        textButton: "Save",
        onpressedin: () {
          if (title.text.isEmpty ||
              amount.text.isEmpty ||
              category.text.isEmpty ||
              date.text.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Fill all fields")));
            return;
          }

          double? amt = double.tryParse(amount.text);
          if (amt == null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Invalid amount")));
            return;
          }

          DateTime parsedDate;
          try {
            parsedDate = DateFormat("dd/MM/yyyy").parse(date.text);
          } catch (_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Invalid date")));
            return;
          }

          // 🔥 UPDATE
          ref.read(expenseProvider.notifier).updateExpense(
                widget.id,
                title.text,
                amt,
                category.text,
                parsedDate,
              );

          Navigator.pop(context);
        },
      ),
    );
  }
}
