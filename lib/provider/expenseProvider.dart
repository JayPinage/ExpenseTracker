import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expensetracker/database/expensedb.dart';
import 'package:expensetracker/model/expenseModel.dart';


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
      "date": date.toIso8601String(),
    });

    await loaddata();
  }

  Future<void> deleteExpense(int id) async {
    final db = await Dbhelper.instance();
    await db.delete("expense", where: "id=?", whereArgs: [id]);
    await loaddata();
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
      {
        "title": title,
        "amount": amount,
        "category": category,
        "date": date.toIso8601String(),
      },
      where: "id=?",
      whereArgs: [id],
    );

    await loaddata();
  }

  double get totalExpense {
  return state.fold(0, (sum, item) => sum + item.amount);
}


}

final expenseProvider =
    StateNotifierProvider<Expenseprovider, List<ExpenseModel>>(
  (ref) => Expenseprovider(),
);


final totalExpenseProvider = Provider<double>((ref) {
  final expenses = ref.watch(expenseProvider);

  double total = 0;
  for (var e in expenses) {
    total += e.amount;
  }
  return total;
});
