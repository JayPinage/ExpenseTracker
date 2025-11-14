import 'package:expensetracker/screens/add_expense.dart';
import 'package:expensetracker/screens/edit_expense.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // ---------------- HEADER ----------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Expense Tracker",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddExpense()),
                      );
                    },
                    icon: Icon(Icons.add_circle,
                        size: 28, color: Colors.blue),
                  ),
                ],
              ),
            ),

            // ---------------- TOTAL MONEY CARD ----------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Cardwidget(
                amount: 5000,
                month: DateFormat.MMMM().format(DateTime.now()),
              ),
            ),

            SizedBox(height: 12),

            // ---------------- EXPENSE LIST ----------------
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Grocery",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )),
          SizedBox(height: 6),
          Text("12 Nov 2024",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              )),
        ],
      ),

      Spacer(),

      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("₹ 500",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 6),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditExpense()),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    ],
  ),
),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
