import 'package:expensetracker/database/expensedb.dart';
import 'package:expensetracker/model/expenseModel.dart';
import 'package:riverpod/legacy.dart';

class Expenseprovider extends StateNotifier<List<ExpenseModel>> {
  Expenseprovider() : super([]) {
    loaddata();
  }

  Future<void> loaddata() async {
    final db = await Dbhelper.instance();

    final data = await db.query('expense');

    state = data.map((e) => ExpenseModel.fromMap(e)).toList();
  }

  Future<void> addExpense(
    String title,
    double amount,
    String category,
    DateTime date,
  ) async {
    final db = await Dbhelper.instance();

    await db.insert("expense", {
      "title": title,
      "amount": amount,
      "category": category,
      "date": date,
    });

    loaddata();
  }

  Future<void> deleteExpense(int id) async {
    final db = await Dbhelper.instance();

    await db.delete("expense", where: "id=?", whereArgs: [id]);

    loaddata();
  }

  Future<void> updateExpense(
    int id,
    String title,
    double amount,
    String category,
    DateTime date,
  ) async {
    final db = await Dbhelper.instance();

    await db.update(
      "expense",
      {"title": title, "amount": amount, "category": category, "date": date},
      where: "id=?",
      whereArgs: [id],
    );
  }
}


final expenseProvider=StateNotifierProvider<Expenseprovider,List<ExpenseModel>>((ref)=>Expenseprovider());
