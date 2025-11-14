import 'package:flutter/material.dart';

class Cardwidget extends StatelessWidget {
  final double amount;
  final String month;
  const Cardwidget({super.key, required this.amount, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),   // <-- FIXED
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,   // <-- FIXED
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Total", style: TextStyle(fontSize: 18)),
          SizedBox(height: 5),
          Text("₹ $amount",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(month, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
