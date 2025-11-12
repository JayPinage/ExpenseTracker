

class ExpenseModel{

  final int? id;
  final String title;
  final double amount;
  final String category;
  final DateTime date;

  ExpenseModel({ this.id, required this.title, required this.amount, required this.category, required this.date});


 Map<String,dynamic>tomap(){
  return {
    "id":id,
    "title":title,
    "amount":amount,
    "category":category,
    "date":date

  };
  
 }

 factory ExpenseModel.fromMap(Map<String,dynamic>map){
  return ExpenseModel
  (title: map['title'], 
  amount: map['amount'], 
  category: map['category'], 
  date: map['date']);
 }

}