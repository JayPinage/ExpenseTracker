import 'package:flutter/material.dart';

class Addtransactioncard extends StatelessWidget {
  final TextEditingController title;
  final TextEditingController amount;
  final TextEditingController category;
  final TextEditingController date;
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
    return SizedBox(
      width: double.infinity,
      height: 450,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20,),
              // TITLE
              customTextfield(
                labelText: 'Title',
                controller: title,
              ),

              SizedBox(height: 20),

              // AMOUNT
              customTextfield(
                labelText: 'Amount',
                controller: amount,
              ),

              SizedBox(height: 20),

              // CATEGORY DROPDOWN INSIDE TEXTFIELD
              TextField(
                readOnly: true,
                controller: category,
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                  suffixIcon: PopupMenuButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down),
                    onSelected: (value) {
                      category.text = value; // Update controller
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(value: "Food", child: Text("Food")),
                      PopupMenuItem(value: "Travel", child: Text("Travel")),
                      PopupMenuItem(value: "Bills", child: Text("Bills")),
                      PopupMenuItem(value: "Shopping", child: Text("Shopping")),
                      PopupMenuItem(value: "Salary", child: Text("Salary")),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // DATE TEXTFIELD OPENS CALENDAR
              TextField(
                controller: date,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Date",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_month),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    date.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
              ),

              SizedBox(height: 30),

              // BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: onpressedin,
                  child: Text(
                    textButton,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget customTextfield({
  required String labelText,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
    ),
  );
}
