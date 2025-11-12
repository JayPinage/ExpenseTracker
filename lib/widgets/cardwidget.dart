

import 'package:flutter/material.dart';

class Cardwidget extends StatelessWidget {
  final double amount;
  final String month;
  const Cardwidget({super.key, required this.amount, required this.month});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      
      child: Column(
        children: [
        Text("Total",style: TextStyle(fontSize: 28),),
        Text("₹ $amount",style: TextStyle(fontSize: 40,),),

        SizedBox(height: 15,),
        Text(month,style: TextStyle(fontSize: 28),)

        

        ],
      ),
    );
  }
}