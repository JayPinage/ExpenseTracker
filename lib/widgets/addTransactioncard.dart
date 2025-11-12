import 'package:flutter/material.dart';

class Addtransactioncard extends StatelessWidget {
  final String title;
  final double amount;
  final String category;
  final String date;
  final VoidCallback onpressedin;
  final String textButton;
  const Addtransactioncard({
    super.key,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.onpressedin,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title", style: TextStyle(fontSize: 18)),

            Text(title),

            Divider(height: 10, thickness: 4),

            Text("Amount", style: TextStyle(fontSize: 18)),

            Text("$amount"),

            Divider(height: 10, thickness: 4),

            Text("Category", style: TextStyle(fontSize: 18)),

            Text(category),

            Divider(height: 10, thickness: 4),

            Text("Date", style: TextStyle(fontSize: 18)),

            Text("$date"),

            Divider(height: 10, thickness: 4),

            SizedBox(height: 20),

            ElevatedButton(onPressed: onpressedin, child: Text(textButton)),
          ],
        ),
      ),
    );
  }
}
