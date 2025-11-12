import 'package:expensetracker/widgets/addTransactioncard.dart';
import 'package:expensetracker/widgets/cardwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Expense Tracker",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_circle, size: 28, color: Colors.blue),
                  ),
                ],
              ),
            ),

            Cardwidget(
              amount: 5000,
              month: DateFormat.MMMM().format(DateTime.now()).toString(),
            ),


            Addtransactioncard(
              title: 'cook',
              amount: 5000, 
              category: 'food', 
              date:  DateFormat('MMM d').format(DateTime.now()), 
              onpressedin: () { 
                print("Hello");
               }, 
              textButton: 'Save',)
          ],
        ),
      ),
    );
  }
}
